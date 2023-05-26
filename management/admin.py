from django.contrib import admin
from .models import Room,Labour,RoomLabour,Supervisor,Manager
# Register your models here.
class RoomLabourAdmin(admin.ModelAdmin):
    list_display = ['room_id_id','labour_id_id']

class RoomAdmin(admin.ModelAdmin):
    list_display = ['room_id','room_no']

class LabourAdmin(admin.ModelAdmin):
    list_display = ['labour_id','labour_name','phone_no']
 
class SupervisorAdmin(admin.ModelAdmin):
    list_display = ['supervisor_id','supervisor_name','phone_no','email']
 
class ManagerAdmin(admin.ModelAdmin):
    list_display = ['manager_id','manager_name','phone_no','email']
 

#..................................................................................#


admin.site.register(Room,RoomAdmin)
admin.site.register(RoomLabour,RoomLabourAdmin)
admin.site.register(Labour,LabourAdmin)
admin.site.register(Supervisor,SupervisorAdmin)
admin.site.register(Manager,ManagerAdmin)

 