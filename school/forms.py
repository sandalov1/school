from django import forms
from django.contrib.auth import authenticate, get_user_model
from django.contrib.auth.models import User as UserModel
from schoolbase.models import Prepodavateli, Klass


User = get_user_model()

class UserLoginForm(forms.Form):
	username = forms.CharField(label = 'Логин', widget=forms.TextInput(attrs={'class': 'form-control'}))
	password = forms.CharField(label = 'Пароль', widget=forms.PasswordInput(attrs={'class': 'form-control'}))

	def clean(self, *args, **kwargs):
		username = self.cleaned_data.get('username')
		password = self.cleaned_data.get('password')
		
		if username and password:
			user = authenticate(username = username, password = password)
				
			try:
				vaild_user = UserModel.objects.get(username=username)
			except UserModel.DoesNotExist:
				raise forms.ValidationError('Пользователь не существует!')
			
			if not user:
				raise forms.ValidationError('Не верный пароль!')

		return super(UserLoginForm, self).clean(*args, **kwargs)


class PrepodList(forms.Form):
	prepod = forms.ModelChoiceField(queryset = Prepodavateli.objects.none())

	def __init__(self, *args, **kwargs):
		prepod = kwargs.pop('prepod', None)
		super(PrepodList, self).__init__(*args, **kwargs)
		self.fields['prepod'].queryset = Prepodavateli.objects.all()
		self.fields['prepod'].widget.attrs.update({'class': 'form-control', 'id': 'id_prepod'})
		if prepod:
			self.fields['prepod'].initial=prepod


class KlassList(forms.Form):
	klass = forms.ModelChoiceField(queryset = Klass.objects.none())

	def __init__(self, *args, **kwargs):
		klass = kwargs.pop('klass', None)
		super(KlassList, self).__init__(*args, **kwargs)
		self.fields['klass'].queryset = Klass.objects.all()
		self.fields['klass'].widget.attrs.update({'class': 'form-control', 'id': 'id_klass'})
		if klass:
			self.fields['klass'].initial=klass