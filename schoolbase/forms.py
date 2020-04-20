from django import forms
from .models import Raspisanie, Tarif


class CreateUpdateUrok(forms.ModelForm):
	class Meta(object):
		model = Raspisanie
		fields = ('r_predmet','prepodavatel','kabinet')

	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)
		for field in self.Meta.fields:
			self.fields[field].widget.attrs.update({'class': 'form-control'})

		self.fields['prepodavatel'].widget.attrs.update({'id': 'id_fio'})
		self.fields['r_predmet'].widget.attrs.update({'id': 'id_predmet'})


class CreateUpdateTarif(forms.ModelForm):
	class Meta(object):
		model = Tarif
		fields = ('col_urokov',)

	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)
		for field in self.Meta.fields:
			self.fields[field].widget.attrs.update({'class': 'form-control'})

