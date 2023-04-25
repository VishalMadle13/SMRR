from rest_framework import serializers
from .models import room_state




class RoomStateSerializer(serializers.ModelSerializer):
    class Meta:
        model = room_state
        fields = '__all__'
  