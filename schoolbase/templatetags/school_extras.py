from django import template
from schoolbase.models import Raspisanie, Tarif

register = template.Library()

@register.filter(name='divide')
def devide(value, arg):
	try:
		return int(value) % int(arg)
	except (ValueError, ZeroDivisionError):
		return None


@register.simple_tag
def selectnum(predmety, klass, urok, day):
	prdmt = Raspisanie.objects.filter(klass=klass.pk, urok=urok.pk, day_nedeli=day.pk)

	if prdmt:
		return prdmt[0]

	return None


@register.simple_tag
def selectnumtarif(predmety, klass):
	prdmt = Tarif.objects.filter(klass=klass.pk, r_predmet=predmety.pk)
	if prdmt:
		return prdmt[0]

	return None


@register.simple_tag
def selectnumprepod(predmety, klass, urok, day, prepod):
	prdmt = Raspisanie.objects.filter(klass=klass.pk, urok=urok.pk, day_nedeli=day.pk, prepodavatel=prepod)

	if prdmt:
		return prdmt[0]

	return None


@register.simple_tag
def selectnumklass(predmety, klass, urok, day):
	prdmt = Raspisanie.objects.filter(klass=klass, urok=urok.pk, day_nedeli=day.pk)

	if prdmt:
		return prdmt[0]

	return None