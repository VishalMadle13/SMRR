from django.db import models
from flutter.models import room_state

class iot_devices(models.Model):
    mac_id      = models.CharField(("mac_id"), max_length=50,primary_key=True)
    device_name = models.CharField(("device_name"), max_length=50)
    senses_gas  = models.CharField(("senses_gas"), max_length=50)


class iot_log(models.Model):
    log_id = models.AutoField(("log_id"),primary_key=True)
    time   = models.TimeField(("time"),  auto_now_add=True)
    room_id = models.ForeignKey(room_state, on_delete=models.CASCADE)
    gas01  = models.DecimalField(("gas01"), max_digits=12, decimal_places=8)
    gas02  = models.DecimalField(("gas02"), max_digits=12, decimal_places=8)
    gas03  = models.DecimalField(("gas03"), max_digits=12, decimal_places=8)
    gas04  = models.DecimalField(("gas04"), max_digits=12, decimal_places=8)
     




