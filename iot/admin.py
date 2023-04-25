from django.contrib import admin
from .models import iot_devices,iot_log
 
#...................admin panel....................................................#


class IotLogAdmin(admin.ModelAdmin):
    list_display = ['log_id','room_id_id','time','gas01','gas02','gas03','gas04']
 

class IotDevicesAdmin(admin.ModelAdmin):
    list_display = ['mac_id','device_name','senses_gas']
 

#..................................................................................#


admin.site.register(iot_log,IotLogAdmin)

admin.site.register(iot_devices,IotDevicesAdmin)


#..................................................................................#
