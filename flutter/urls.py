from . import views
from django.contrib import admin
from django.urls import path
 

urlpatterns = [
    # roomstate api  
    # ['GET','POST','PUT','PATCH','DELETE']
   
    path('room/status/',views.room_status,name='room_status'),
    path('room/status/<str:pk>',views.room_status,name='room_status'),
    
    # rooms api  
    # ['GET','POST','DELETE']
    # path('room/',views.room_data,name='room_data'),
    # path('room/<str:pk>',views.room_data,name='room_data'),
]
