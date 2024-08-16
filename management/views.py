from django.shortcuts import render
from flutter.models import *
from django.db.models import *
# Create your views here.

def dashboard(request):
    hygenicRooms = len(list(room_state.objects.filter(Q(state='1') |Q( state = '2'))))
    print(hygenicRooms)
    allRoomData = list(room_state.objects.all())
    totalRooms = len(allRoomData)
    allRoomData = [
        [{"room_id":rs.room_id.room_id} , {"room_no" : rs.room_id.room_no}, {"state": 'clean' if rs.state == '1' else 'moderate' if rs.state == '2' else 'unhygenic'}, {"time":rs.time}]
        for rs in allRoomData
    ] 
    unhygenicRoomsCount = len([rs for rs in allRoomData if rs[2]['state'] == 'unhygenic'])
    
    most_recent_time = room_state.objects.filter(state=1).aggregate(Max('time'))['time__max']
    recent_cleaned_room = room_state.objects.filter(state=1, time=most_recent_time).first().room_id.room_no

    data = {
         "allRoomData":allRoomData ,
         "hygenicRooms": int((hygenicRooms/totalRooms)*100),
         "unhygenicRoomsCount" : unhygenicRoomsCount,
         "recent_cleaned_room" : recent_cleaned_room
    } 

    return render(request,'dashboard.html', data)


def report(request):
    return render(request,'monthly_report.html')



