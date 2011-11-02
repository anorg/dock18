from django import forms

class SubscribeForm(forms.Form):
    
    email_address = forms.EmailField(label='')
