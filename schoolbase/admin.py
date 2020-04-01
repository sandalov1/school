from django.contrib import admin
from .models import DenbNedeli, Kabinet, Klass, Predmet, Prepodavateli, Uroki, Raspisanie

admin.site.register({DenbNedeli, Kabinet, Klass, Predmet, Prepodavateli, Uroki, Raspisanie})