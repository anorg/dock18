import re

from django import forms
from django.conf import settings

from uni_form.helper import FormHelper
from uni_form.layout import Layout, Div, ButtonHolder, Submit


from submission.models import Entry



class SubmissionEntryForm(forms.ModelForm):
    
    class Meta:
        model = Entry
        fields = ('url','description')

        
        
        
class SubmissionEntryBaseForm(forms.Form):
    url = forms.CharField(max_length=100)
    description = forms.CharField()
    plugin_type = forms.CharField()
    submission_id = forms.IntegerField()
