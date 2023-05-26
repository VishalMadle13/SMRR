from django.contrib import admin
from .models import room_state

# Register your models here.

#...................admin panel................#

 
class roomStateAdmin(admin.ModelAdmin):
    list_display = ['room_id','gas01','gas02','gas03','gas04','state']
 
#..............................................#
 
admin.site.register(room_state,roomStateAdmin)

#..............................................#
