from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from weasyprint import HTML
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, authenticate, logout, update_session_auth_hash
from .forms import UserLoginForm, PrepodList, KlassList

from schoolbase.models import DenbNedeli, Uroki, Klass, Raspisanie, Prepodavateli, Tarif, Predmet

import tempfile

def home_view(request):
	days = DenbNedeli.objects.all()
	uroki = Uroki.objects.all()
	klassy = Klass.objects.all()

	return render(request, 'index.html', {'days': days, 'uroki': uroki, 'klassy': klassy})


@login_required(login_url='/login/')
def tarif_view(request):
	tarifs = Tarif.objects.all()
	predmets = Predmet.objects.all()
	klassy = Klass.objects.all()
	persent = 80/len(klassy)

	return render(request, 'tarif.html', {'tarifs': tarifs, 'predmets': predmets, 'klassy': klassy, 'persent': persent})


def teacher_view(request, pk=None):
	days = DenbNedeli.objects.all()
	uroki = Uroki.objects.all()
	klassy = Klass.objects.all()
	prepod = None
	fio=''
	if pk:
		prepod = pk
		fio = Prepodavateli.objects.get(id_prepodavatelya=pk)

	form = PrepodList(prepod=prepod)
	return render(request, 'teachers.html', {'days': days, 'uroki': uroki, 'klassy': klassy, 'prepod': prepod, 'fio': fio, 'form': form})
	

def student_view(request, pk=None):
	days = DenbNedeli.objects.all()
	uroki = Uroki.objects.all()
	klassy = Klass.objects.all()
	klass = None
	name = ''
	if pk:
		klass = pk
		name = Klass.objects.get(id_klass=pk)

	form = KlassList(klass=klass)
	return render(request, 'students.html', {'days': days, 'uroki': uroki, 'klass': klass, 'name': name, 'form': form})


def login_view(request):
	form = UserLoginForm(request.POST or None)
	next_ = request.GET.get('next')

	if form.is_valid():
		username = request.POST.get('username')
		password = request.POST.get('password')
		user = authenticate(username = username.strip(), password = password.strip())
		
		login(request, user)
		next_post = request.POST.get('next')
		redirect_path = next_ or next_post or '/'

		return redirect(redirect_path)

	return render(request, 'login.html', {'form': form})


def logout_view(request):
	logout(request)
	return redirect('home')