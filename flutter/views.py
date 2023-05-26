
#..........................function based  api view...............................................#


from django.db.models.base import ObjectDoesNotExist
from django.shortcuts import render
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from .serializers import RoomStateSerializer 
from .models import room_state


#......................................................................................................#

# from model import Model

#......................................................................................................#




#............................for user authentication...................................................#


from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import authentication_classes,permission_classes

#......................................................................................................#

@api_view(['GET','POST'])
@authentication_classes([BasicAuthentication])
@permission_classes([IsAuthenticated])

#..............................room_status...................................................................#


def room_status(request,pk=None):
    try:
        id = pk
        if id is not None :
            print(id)
            room_curr_status = room_state.objects.get(room_id=id)  #latest row with room_id = id  
            print(room_curr_status)
            serializer = RoomStateSerializer(room_curr_status)
            return Response(serializer.data)
        room_curr_status = room_state.objects.all()   
        print(room_curr_status)
        serializer = RoomStateSerializer(room_curr_status,many=True)
        return Response(serializer.data)
    except ObjectDoesNotExist:
            return Response({'success': False,'msg':'DataDoesNotExist'})
    except Exception as e :
            print(e)
            return Response({'success':False,'msg':' Error!'})

# ...........................................................................................................#
# ................................*****......................................................................#


# @api_view(['GET','POST','DELETE'])
# @authentication_classes([BasicAuthentication])
# @permission_classes([IsAuthenticated])

# .............................rooms........................................................................#

# def room_data(request,pk=None):
# 	if request.method == 'GET':
# 		try:
# 			room_id = pk
# 			if room_id is not None :
# 				r = rooms.objects.get(room_id=room_id)
# 				serializer = RoomSerializer(r)
# 				return Response(serializer.data)
# 			r = rooms.objects.all()
# 			serializer = RoomSerializer(r,many= True)
# 			return Response(serializer.data)
# 		except ObjectDoesNotExist:
# 			return Response({'success': False,'msg':'DataDoesNotExist'})
# 		except Exception as e :
# 			return Response({'success':False,'msg':' Error!'})

# #..............................POST...................................................................#

# 	if request.method == 'POST':
# 		try:
# 			data = request.data
# 			serializer = RoomSerializer(data = data)
# 			if serializer.is_valid():
# 				serializer.save()
# 				return Response({'success': True,'msg':'Data Created'},status=status.HTTP_201_CREATED)
# 			return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
# 		except Exception as e:
# 			print(e)
# 			return Response({'success':False,'msg':'Error!!'},status=status.HTTP_400_BAD_REQUEST)

# #..............................DELETE...................................................................#

# 	if request.method == 'DELETE':
# 		try:
# 			room_id = pk
# 			r = rooms.objects.get(room_id = room_id)
# 			r.delete()
# 			return Response({'success': True,'msg':'Data Deleted'})
# 		except ObjectDoesNotExist:
# 			return Response({'success': False,'msg':'DataDoesNotExist'},status=status.HTTP_400_BAD_REQUEST)
# 		except Exception as e :
# 			return Response({'success':False,'msg':'Error!'},status=status.HTTP_400_BAD_REQUEST)

# # ...........................................................................................................#
# # ................................*****......................................................................
