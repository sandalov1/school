from django.db.models import Q
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

from .models import Klass, DenbNedeli, Uroki, Prepodavateli, Raspisanie
from .forms import CreateUpdateUrok


@login_required(login_url='/login/')
def create_urok(request, day, urok, klass):
	klassdb = Klass.objects.get(id_klass=klass)
	daydb = DenbNedeli.objects.get(id_denb_nedeli=day)
	urokdb = Uroki.objects.get(id_uroka=urok)

	if request.method=='POST':
		form = CreateUpdateUrok(request.POST)
		if form.is_valid():
			new_form = form.save(commit=False)
			new_form.day_nedeli = daydb
			new_form.urok = urokdb
			new_form.klass = klassdb
			new_form.save()
			return redirect('home')
		else:
			error = 'Недопустипое значение!'
			new_form = CreateUpdateUrok(request.POST)
			return render(request, 'schoolbase/create_urok.html', {'form': new_form, 'error': error, 'klass': klassdb, 'day': daydb, 'urok': urokdb})

	form = CreateUpdateUrok()
	
	return render(request, 'schoolbase/create_urok.html', {'form': form, 'klass': klassdb, 'day': daydb, 'urok': urokdb})


@login_required(login_url='/login/')
def update_urok(request, pk):
	urok = Raspisanie.objects.get(id_raspisanie=pk)
	edit_urok = CreateUpdateUrok(instance=urok)
	klassdb = urok.klass
	daydb = urok.day_nedeli
	urokdb = urok.urok

	if request.method=='POST':
		form = CreateUpdateUrok(request.POST, instance=urok)

		if 'delete' in request.POST:
			urok.delete()
			return redirect('home')

		if form.is_valid():
			edit_urok = form.save(commit=False)
			edit_urok.save()
			return redirect('home')
		else:
			edit_urok = CreateUpdateUrok(request.POST)
			return render(request, 'objects/update_urok.html', {'form': edit_urok, 'error': error, 'klass': klassdb, 'day': daydb, 'urok': urokdb})
	
	return render(request, 'schoolbase/update_urok.html', {'form': edit_urok, 'klass': klassdb, 'day': daydb, 'urok': urokdb})


def get_fio(request):
	predmet_id = request.GET.get('predmet')
	fios = Prepodavateli.objects.filter(Q(predmet_1=predmet_id) | Q(predmet_2=predmet_id) | Q(predmet_3=predmet_id)).values('id_prepodavatelya', 'fio').distinct().order_by('fio')

	return render(request, 'schoolbase/fio_drop_down_list.html', {'fios': fios})