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



#........................................................................#

# from .model import Model
from .GNB import Model
import os



#........................................................................#

# ............................for user authentication......................................#


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
            room_no = data['room_no']
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
            print(result)
            state = str(result)
            print(state)

            print(room_id)
            print(type(room_id))
            if not room_state.objects.filter(room_id = room_id).exists() :
                print(" not Exist 1")
                dt = room_state(room_id = room_id, gas01 = g1, gas02 = g2 , gas03 = g3 , gas04 = g4, state = state,room_no = room_no)
                dt.save()
                print("saved")
            else:
                room_state.objects.filter(room_id=room_id).update(room_id=room_id,gas01=gas01,gas02=gas02,gas03=gas03,gas04=gas04,state=state,room_no = room_no)
                print(" updated")
            serializerlog = IotLogSerializer(data=data) 
            if serializerlog.is_valid()  :
                serializerlog.save() 
                return Response({'success': True, 'msg': 'Data Created'},status=status.HTTP_201_CREATED)
            return Response(serializerlog.errors, status=status.HTTP_400_BAD_REQUEST)
        
        except Exception as e:
            print(e)
            return Response({'success': False, 'msg': 'Error!!'}, status=status.HTTP_400_BAD_REQUEST)


# .........................................................................................................#
