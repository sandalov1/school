from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from django.urls import include

from . views import home_view, tarif_view, teacher_view, student_view, login_view, logout_view


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home_view, name = 'home'),
    path('tarif/', tarif_view, name='tarif'),
    path('teacher/', teacher_view, name = 'teacher'),
    path('teacher/<int:pk>', teacher_view, name = 'teacher'),
    path('student/', student_view, name = 'student'),
    path('student/<int:pk>', student_view, name = 'student'),
    path('login/', login_view, name = 'login'),
    path('logout/', logout_view, name = 'logout'),
    path('schoolbase/', include(('schoolbase.urls', 'schoolbase'))),
]
