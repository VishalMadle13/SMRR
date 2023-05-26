# ..........................function based  api view...............................................#


from rest_framework.decorators import authentication_classes, permission_classes
from .models import iot_log
from .serializers import IotLogSerializer
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import BasicAuthentication
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from django.shortcuts import render
from django.db.models.base import ObjectDoesNotExist
from flutter.models import room_state
from flutter.serializers import RoomStateSerializer
from management.send_sms import SendMessage
from management.models import RoomLabour,Labour,Room

#........................................................................#

# from .model import Model
from .GNB import Model
import os



#........................................................................#

# ............................for user authentication......................................#


# ........................................................................#


# ........................................................................#

def send_message_to_labour(result,labour_phone_no,text,room_no):
    # print("room_state in func :",result)
    # print("room_state in func :",type(result))
    result = str(result)
    labour_phone_no = str(labour_phone_no)
    # print("room_state in func :",type(result))
    text = "text"
    # print(type(text))
    # print(type(labour_phone_no))
    if(result == "3"): # message sent to supervioser
            # text = f"washrooms {room_no} have reached an unacceptable level of uncleanliness and have not been cleaned for many days. Urgent action is needed to address this issue. "
            text = f"Room no. {room_no} became very unhygenic."
            # SendMessage.send(labour_phone_no,text)
            print("message sent 3")
    elif result == "2" :  # message sent to labour
            text = f"washroom room no. {room_no} become unhygienic. It needs to clean up "
            # SendMessage.send(labour_phone_no,text) 
            print("message sent 2")
    print("text :",text)
    if(result!="1" ) :
        print(f"message ==> sent to : {labour_phone_no} , and context of msg :{text}.")

# ........................................................................#



@api_view([ 'GET','POST'])
@authentication_classes([BasicAuthentication])
@permission_classes([IsAuthenticated])


# ..............................GET.....................................#

def iot_gas_data(request):
    
    if request.method == 'GET':
        try:
            devices = iot_log.objects.all()
            serializer = IotLogSerializer(devices,many= True)
            return Response(serializer.data)
        except Exception as e :
            return Response({'success':False,'msg':' Error!'})


# ..............................POST.....................................#

    if request.method == 'POST':
        try:
            data = request.data
            room_id = data['room_id'] 
            gas01 = data['gas01']
            gas02 = data['gas02']
            gas03 = data['gas03']
            gas04 = data['gas04']
        
            g1 = float(gas01)
            g2 = float(gas02)
            g3 = float(gas03)
            g4 = float(gas04)
            lst = [[g1,g2,g3,g4]]

            result = Model.RoomState(lst) 
            state = str(result) 

            room_obj = Room.objects.get(room_id=room_id)
            room_id = room_obj.room_id
            room_no = room_obj.room_no

            room_labour_obj = RoomLabour.objects.get(room_id=room_id)
            labour_obj = room_labour_obj.labour_id
            labour_phone_no = labour_obj.phone_no
            
            

            prev =  room_state.objects.get(room_id=room_id).state if room_state.objects.filter(room_id=room_id).exists() else 0
            prev = str(prev)
            curr = state 
            print("prev : ",prev)
            print("curr : ",curr) 
            print("room_state : " ,room_state.state)
            # ................. previous and current room state ..........................#
            # condition is added for avoid the continuous sending of sms on each 
            # request of IoT device.
            text = ""
            if prev == "1" and (curr == "2" or curr == "3") or prev == "2"  and curr == "3" or prev == "0" and (curr == "2" or curr == "3") :      
                send_message_to_labour(result,labour_phone_no,text,room_no)
            


            if not room_state.objects.filter(room_id = room_id).exists() : 
                dt = room_state(room_id = room_obj, gas01 = g1, gas02 = g2 , gas03 = g3 , gas04 = g4, state = state)
                dt.save() 
            else:
                room_state.objects.filter(room_id=room_obj).update(room_id=room_id,gas01=gas01,gas02=gas02,gas03=gas03,gas04=gas04,state=state)


            serializerlog = IotLogSerializer(data=data) 
            if serializerlog.is_valid()  :
                serializerlog.save() 
                return Response({'success': True, 'msg': 'Data Created'},status=status.HTTP_201_CREATED)
            return Response(serializerlog.errors, status=status.HTTP_400_BAD_REQUEST)
        
        except Exception as e:
            print(e)
            return Response({'success': False, 'msg': 'Error!!'}, status=status.HTTP_400_BAD_REQUEST)


# .........................................................................................................#
