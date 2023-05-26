from django.db import models

# Create your models here.

class Labour(models.Model):
    labour_id = models.CharField("labour_id", max_length=50, primary_key=True)
    labour_name = models.CharField("labour_name", max_length=50)
    phone_no = models.PositiveIntegerField("labour_phone_no")

class Supervisor(models.Model):
    supervisor_id = models.CharField("supervisor_id", max_length=50, primary_key=True)
    supervisor_name = models.CharField("supervisor_name", max_length=50)
    phone_no = models.PositiveIntegerField("supervisor_phone_no")
    email = models.EmailField("supervisor_email", max_length=254)

class Manager(models.Model):
    manager_id = models.CharField("manager_id", max_length=50, primary_key=True)
    manager_name = models.CharField("manager_name", max_length=50)
    phone_no = models.PositiveIntegerField("manager_phone_no")
    email = models.EmailField("manager_email", max_length=254)

class Room(models.Model):
    room_id = models.CharField("room_id", max_length=20, primary_key=True)
    room_no = models.PositiveIntegerField("room_no")

class RoomLabour(models.Model):
    room_id = models.OneToOneField(Room, verbose_name="room_id", on_delete=models.CASCADE)
    labour_id = models.OneToOneField(Labour, verbose_name="labour_id", on_delete=models.CASCADE)
