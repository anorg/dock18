from django import forms 
from uni_form.helper import FormHelper
from uni_form.layout import Layout, Div, ButtonHolder, Submit

class ParticipateForm(forms.Form):   # or class MyForm(forms.ModelForm)
    form_field_1 = forms.CharField(label='Your name')
    name = forms.CharField()

    def __init__(self, *arg, **kwargs):
        self.helper = FormHelper()
        self.helper.form_action = 'my-url-name-defined-in-url-conf'
        self.helper.form_method = 'GET'

        self.helper.layout = Layout(
            Div(
                'name',
                'form_field_1',
            ),
            Div(
                'form_field_2',
                'form_field_3',
            ),
            ButtonHolder(
                Submit('save', 'Save', css_class='button white')
            ))


        return super(ParticipateForm, self).__init__(*arg, **kwargs)