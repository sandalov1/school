#!/usr/bin/env python
from schoolbase.models import Tarif, Klass, Predmet

klassy = Klass.objects.all()
predmety = Predmet.objects.all()

for klass in klassy:
	for predmet in predmety:
		tarif = Tarif.objects.create(klass=klass, r_predmet=predmet)
		tarif.save()
