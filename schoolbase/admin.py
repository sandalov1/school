from django.contrib import admin
from .models import DenbNedeli, Kabinet, Klass, Predmet, Prepodavateli, Uroki, Raspisanie, Tarif

admin.site.register({DenbNedeli, Kabinet, Klass, Predmet, Prepodavateli, Uroki, Raspisanie, Tarif})