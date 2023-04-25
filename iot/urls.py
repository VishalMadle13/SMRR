from django.contrib import admin
from django.urls import path 
from . import views 

urlpatterns = [
    # ['POST']
    # http://127.0.0.1:8000/iot/data/
    path('data/',views.iot_gas_data,name='IotGasData'),
]
