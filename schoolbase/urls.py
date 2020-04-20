from django.urls import path
from django.conf.urls import url
from .views import clear_raspisane, clear_tarif, create_urok, update_urok, create_tarif, update_tarif, get_fio, update_predmet_tarif, update_klass_tarif


urlpatterns = [
	path('clearraspisane/', clear_raspisane, name='clearraspisane'),
	path('cleartarif/', clear_tarif, name='cleartarif'),
	path('createurok/<int:day>/<int:urok>/<int:klass>', create_urok, name='createurok'),
	path('updateurok/<int:pk>', update_urok, name = 'updateurok'), 
	path('createtarif/<int:predmet>/<int:klass>', create_tarif, name='createtarif'),
	path('updatetarif/<int:pk>', update_tarif, name = 'updatetarif'),
	path('updatepredmettarif/<int:pk>', update_predmet_tarif, name = 'updatepredmettarif'),
	path('updateklasstarif/<int:pk>', update_klass_tarif, name = 'updateklasstarif'),

	path('ajax/get-fio/', get_fio, name = 'ajax_get_fio'),
]
