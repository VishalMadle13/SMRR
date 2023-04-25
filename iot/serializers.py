from rest_framework import serializers
from .models import iot_devices,iot_log


class IotDevicesSerializer(serializers.ModelSerializer):
     class Meta:
        model  = iot_devices
        fields = '__all__'

class IotLogSerializer(serializers.ModelSerializer):
    class Meta:
        model  = iot_log
        fields = '__all__'


