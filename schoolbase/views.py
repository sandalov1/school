from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

from .models import Klass, DenbNedeli, Uroki, Prepodavateli, Raspisanie, Predmet, Tarif
from .forms import CreateUpdateUrok, CreateUpdateTarif

@login_required(login_url='/login/')
def clear_raspisane(request):
	if request.method=='POST':
		if "cancel" in request.POST:
			return redirect('home')

		raspisanie = Raspisanie.objects.all().delete()
		return redirect('home')

	return render(request, 'schoolbase/clear_raspisane.html')


@login_required(login_url='/login/')
def clear_tarif(request):
	if request.method=='POST':
		if "cancel" in request.POST:
			return redirect('tarif')

		raspisanie = Tarif.objects.all().delete()
		return redirect('tarif')

	return render(request, 'schoolbase/clear_tarif.html')


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
			tarif = Tarif.objects.filter(r_predmet=new_form.r_predmet, klass=klass)
			common = Raspisanie.objects.filter(r_predmet=new_form.r_predmet, klass=klass)
			if not tarif:
				error = 'Заполните тарификацию по предмету ' + str(new_form.r_predmet) + ' для ' + str(klassdb) + ' класса!'
				new_form = CreateUpdateUrok(request.POST)
				return render(request, 'schoolbase/create_urok.html', {'form': new_form, 'error': error, 'klass': klassdb, 'day': daydb, 'urok': urokdb})
			if tarif[0].col_urokov<=len(common):
				error = 'По предмету ' + str(new_form.r_predmet) + ' для ' + str(klassdb) + ' класса все учебные часы введены!'
				new_form = CreateUpdateUrok(request.POST)
				return render(request, 'schoolbase/create_urok.html', {'form': new_form, 'error': error, 'klass': klassdb, 'day': daydb, 'urok': urokdb})
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


@login_required(login_url='/login/')
def create_tarif(request, predmet, klass):
	klassdb = Klass.objects.get(id_klass=klass)
	perdmetdb = Predmet.objects.get(id_predmet=predmet)

	if request.method=='POST':
		form = CreateUpdateTarif(request.POST)
		if form.is_valid():
			new_form = form.save(commit=False)
			new_form.r_predmet = perdmetdb
			new_form.klass = klassdb
			new_form.save()
			return redirect('tarif')
		else:
			error = 'Недопустипое значение!'
			new_form = CreateUpdateTarif(request.POST)
			return render(request, 'schoolbase/create_tarif.html', {'form': new_form, 'error': error, 'klass': klassdb, 'predmet': perdmetdb})

	form = CreateUpdateTarif()
	
	return render(request, 'schoolbase/create_tarif.html', {'form': form, 'predmet': perdmetdb, 'klass': klassdb})


@login_required(login_url='/login/')
def update_tarif(request, pk):
	tarif = Tarif.objects.get(id_tarif=pk)
	klassdb = tarif.klass
	perdmetdb = tarif.r_predmet

	form = CreateUpdateTarif(instance=tarif)

	if request.method=='POST':
		form = CreateUpdateTarif(request.POST, instance=tarif)

		if 'delete' in request.POST:
			tarif.delete()
			return redirect('tarif')

		if form.is_valid():
			edit_tarif = form.save(commit=False)
			edit_tarif.save()
			return redirect('tarif')
		else:
			form = CreateUpdateTarif(request.POST)
			return render(request, 'schoolbase/update_tarif.html', {'form': form, 'predmet': perdmetdb, 'klass': klassdb})
	
	return render(request, 'schoolbase/update_tarif.html', {'form': form, 'predmet': perdmetdb, 'klass': klassdb})


@login_required(login_url='/login/')
def update_predmet_tarif(request, pk):
	predmet = Predmet.objects.get(id_predmet=pk)
	klassy = Klass.objects.all()

	if request.method=='POST':
		error = None

		if 'delete' in request.POST:
			tarify = Tarif.objects.filter(r_predmet=predmet)
			for tarif in tarify:
				tarif.delete()
			return redirect('tarif')

		req = dict(request.POST)['col_urokov']
		for t in req:
			if not t:
				error = 'Неверные данные! Заполните еще раз!'
				tarify = {}
				for klass in klassy:
					tarif = Tarif.objects.filter(klass=klass, r_predmet=predmet)
					if tarif:
						tarify[klass] = CreateUpdateTarif(instance=tarif[0])
					else:
						tarify[klass] = CreateUpdateTarif()
				return render(request, 'schoolbase/update_predmet_tarif.html', {'forms': tarify, 'predmet': predmet, 'klassy': klassy, 'error': error})
			if int(t)<1:
				error = 'Неверные данные! Заполните еще раз!'
				tarify = {}
				for klass in klassy:
					tarif = Tarif.objects.filter(klass=klass, r_predmet=predmet)
					if tarif:
						tarify[klass] = CreateUpdateTarif(instance=tarif[0])
					else:
						tarify[klass] = CreateUpdateTarif()
				return render(request, 'schoolbase/update_predmet_tarif.html', {'forms': tarify, 'predmet': predmet, 'klassy': klassy, 'error': error})

		num=0
		for klass in klassy:
			tarif = Tarif.objects.filter(klass=klass, r_predmet=predmet)
			if tarif:
				tarif[0].col_urokov = int(req[num])
				tarif[0].save()
			else:
				tarif = Tarif.objects.create(klass=klass, r_predmet=predmet, col_urokov = int(req[num]))
				tarif.save()
			num += 1
		return redirect('tarif')

	tarify = {}
	for klass in klassy:
		tarif = Tarif.objects.filter(klass=klass, r_predmet=predmet)
		if tarif:
			tarify[klass] = CreateUpdateTarif(instance=tarif[0])
		else:
			tarify[klass] = CreateUpdateTarif()
	return render(request, 'schoolbase/update_predmet_tarif.html', {'forms': tarify, 'predmet': predmet, 'klassy': klassy})

@login_required(login_url='/login/')
def update_klass_tarif(request, pk):
	predmety = Predmet.objects.all().order_by('predmet')
	klass = Klass.objects.get(id_klass=pk)

	if request.method=='POST':
		error = None

		if 'delete' in request.POST:
			tarify = Tarif.objects.filter(klass=klass)
			for tarif in tarify:
				tarif.delete()
			return redirect('tarif')

		req = dict(request.POST)['col_urokov']
		for t in req:
			if not t:
				error = 'Неверные данные! Заполните еще раз!'
				tarify = {}
				for predmet in predmety:
					tarif = Tarif.objects.filter(klass=klass, r_predmet=predmet)
					if tarif:
						tarify[str(predmet)] = CreateUpdateTarif(instance=tarif[0])
					else:
						tarify[str(predmet)] = CreateUpdateTarif()
				return render(request, 'schoolbase/update_klass_tarif.html', {'forms': tarify, 'predmety': predmety, 'klass': klass, 'error': error})

			if int(t)<1:
				error = 'Неверные данные! Заполните еще раз!'
				tarify = {}
				for predmet in predmety:
					tarif = Tarif.objects.filter(klass=klass, r_predmet=predmet)
					if tarif:
						tarify[str(predmet)] = CreateUpdateTarif(instance=tarif[0])
					else:
						tarify[str(predmet)] = CreateUpdateTarif()
				return render(request, 'schoolbase/update_klass_tarif.html', {'forms': tarify, 'predmety': predmety, 'klass': klass, 'error': error})

		num=0
		for predmet in predmety:
			tarif = Tarif.objects.filter(klass=klass, r_predmet=predmet)
			if tarif:
				tarif[0].col_urokov = int(req[num])
				tarif[0].save()
			else:
				tarif = Tarif.objects.create(klass=klass, r_predmet=predmet, col_urokov = int(req[num]))
				tarif.save()
			num += 1
		return redirect('tarif')

	tarify = {}
	for predmet in predmety:
		tarif = Tarif.objects.filter(klass=klass, r_predmet=predmet)
		if tarif:
			tarify[str(predmet)] = CreateUpdateTarif(instance=tarif[0])
		else:
			tarify[str(predmet)] = CreateUpdateTarif()
	return render(request, 'schoolbase/update_klass_tarif.html', {'forms': tarify, 'predmety': predmety, 'klass': klass})



def get_fio(request):
	predmet_id = request.GET.get('predmet')
	fios = Prepodavateli.objects.filter(Q(predmet_1=predmet_id) | Q(predmet_2=predmet_id) | Q(predmet_3=predmet_id)).values('id_prepodavatelya', 'fio').distinct().order_by('fio')

	return render(request, 'schoolbase/fio_drop_down_list.html', {'fios': fios})
