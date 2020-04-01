from django import forms
from django.contrib.auth import authenticate, get_user_model
from django.contrib.auth.models import User as UserModel

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


