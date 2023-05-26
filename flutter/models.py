from django.db import models
from management.models import Room



class room_state(models.Model):
    room_id = models.OneToOneField(Room,on_delete=models.CASCADE,unique=True)
    gas01  = models.DecimalField(("gas01"), max_digits=12, decimal_places=8)
    gas02  = models.DecimalField(("gas02"), max_digits=12, decimal_places=8)
    gas03  = models.DecimalField(("gas03"), max_digits=12, decimal_places=8)
    gas04  = models.DecimalField(("gas04"), max_digits=12, decimal_places=8)
    state  = models.CharField(("state"), max_length=50)

    




