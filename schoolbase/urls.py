from django.urls import path
from django.conf.urls import url
from .views import create_urok, update_urok, get_fio


urlpatterns = [
	path('createurok/<int:day>/<int:urok>/<int:klass>', create_urok, name='createurok'),
	path('updateurok/<int:pk>', update_urok, name = 'updateurok'), 

	path('ajax/get-fio/', get_fio, name = 'ajax_get_fio'),
]
