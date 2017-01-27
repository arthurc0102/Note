# Bootstrap form

``` python
from django.forms import ModelForm, Textarea
from candidate.models import Candidate


class BootstrapModelForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(BootstrapModelForm, self).__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})


class CandidateForm(BootstrapModelForm):
    class Meta:
        model = Candidate
        fields = ['name', 'party', 'age', 'politics']
        widgets = {'politics': Textarea(attrs={'style': 'resize: vertical;'})}

```
