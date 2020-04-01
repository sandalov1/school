from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from django.urls import include

from . views import home_view, login_view, logout_view


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home_view, name = 'home'),
    path('login/', login_view, name = 'login'),
    path('logout/', logout_view, name = 'logout'),
    path('schoolbase/', include(('schoolbase.urls', 'schoolbase'))),
]
