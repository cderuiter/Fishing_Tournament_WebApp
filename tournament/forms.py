from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.forms import inlineformset_factory

from .models import *


class RegisterTournamentForm(forms.ModelForm):
    class Meta:
        model = Tournament
        fields = ['Tournament_Name', 'Tournament_Date', 'Tournament_Entry_Fee',
                  'Tournament_First_Prize', 'Tournament_Second_Prize', 'Tournament_Third_Prize']


class RegisterLocationForm(forms.ModelForm):
    class Meta:
        model = Location
        fields = ['State', 'County', 'Lake']


class RegisterSponsorForm(forms.ModelForm):
    class Meta:
        model = Sponsor
        fields = ['Sponsor_Name', 'Sponsor_Tier']


class SponsorOptionForm(forms.Form):
    hasSponsor = forms.TypedChoiceField(
        label="Does your tournament have a sponsor?",
        choices=((1, "Yes"), (0, "No")),
        coerce=lambda x: bool(int(x)),
        widget=forms.RadioSelect,
        initial='1',
        required=True,
    )


class RegisterSponsorForm(forms.ModelForm):
    class Meta:
        model = Sponsor
        fields = ['Sponsor_Name', 'Sponsor_Tier']


class RegisterTeamForm(forms.ModelForm):
    Number_Of_Anglers = forms.IntegerField()

    class Meta:
        model = Team
        fields = ['Team_Name', 'Team_Owner']

    def save(self, commit=True):
        return super(RegisterTeamForm, self).save(commit=commit)


class RegisterTournamentTeamForm(forms.ModelForm):
    class Meta:
        model = RegisteredTeam
        fields = ['Paid_Status']


class RegisterAnglerForm(forms.ModelForm):
    class Meta:
        model = Angler
        fields = ['First_Name', 'Last_Name', 'Date_Of_Birth']


class RegisterTrnOfficialForm(forms.ModelForm):
    class Meta:
        model = Official
        fields = ['First_Name', 'Last_Name']


class CreateTournamentRuleForm(forms.ModelForm):
    Fish = forms.CharField()

    class Meta:
        model = TournamentRule
        fields = ['Minimum_Fish_Length', 'Minimum_Fish_Weight']


class CaughtFishForm(forms.ModelForm):
    def __init__(self, pk, *args, **kwargs):
        super(CaughtFishForm, self).__init__(*args, **kwargs)  # populates the form
        self.fields['Tournament'].queryset = Tournament.objects.filter(trn_id=pk)

    class Meta:
        model = CaughtFish
        fields = ['Tournament', 'Team', 'Angler', 'Fish', 'Fish_Length', 'Fish_Weight']


