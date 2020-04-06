from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import render, redirect

from django.views.generic import ListView, DetailView, DeleteView, UpdateView, CreateView
from tournament.forms import RegisterTournamentForm, RegisterLocationForm, RegisterSponsorForm, SponsorOptionForm, \
    RegisterTeamForm, RegisterAnglerForm, RegisterTournamentTeamForm, RegisterTrnOfficialForm, CreateTournamentRuleForm, \
    CaughtFishForm
from tournament.models import Tournament, Location, Sponsor, Team, RegisteredTeam, Angler, TrnOfficial, Fish, \
    TournamentRule, CaughtFish


class TrnListView(ListView):
    model = Tournament
    template_name = 'tournament/home.html'
    context_object_name = 'tournaments'
    ordering = ['Tournament_Date']


class TrnDetailView(DetailView):
    model = Tournament


class TrnDeleteView(DeleteView):
    model = Tournament
    success_url = '/'


class TrnUpdateView(UpdateView):
    model = Tournament
    fields = ['Tournament_Name', 'Tournament_Date', 'Tournament_Entry_Fee',
              'Tournament_First_Prize', 'Tournament_Second_Prize', 'Tournament_Third_Prize']


class LocationUpdateView(UpdateView):
    model = Location
    fields = ['State', 'County', 'Lake']


class SponsorUpdateView(UpdateView):
    model = Sponsor
    fields = ['Sponsor_Name', 'Sponsor_Tier']


class FishCreate(CreateView):
    model = Fish
    fields = ['Fish_Type', 'Average_Fish_Length', 'Average_Fish_Weight']


class FishUpdateView(UpdateView):
    model = Fish
    fields = ['Fish_Type', 'Average_Fish_Length', 'Average_Fish_Weight']


class FishListView(ListView):
    model = Fish
    template_name = 'tournament/fish.html'
    context_object_name = 'fishlist'
    ordering = ['Fish_Type']


@login_required
def registerTournament(request):
    # Execute if a post request is returned
    if request.method == 'POST':
        reg_trn_form = RegisterTournamentForm(request.POST)
        reg_lc_form = RegisterLocationForm(request.POST)
        reg_spn_form = RegisterSponsorForm(request.POST)
        spn_opt_form = SponsorOptionForm(request.POST)

        # Execute if the tournament has a sponsor and the sponsor form needs to be presented
        if spn_opt_form.is_valid() and spn_opt_form.cleaned_data.get('hasSponsor') == 1 and not reg_spn_form.is_valid():
            reg_trn_form = RegisterTournamentForm(request.POST)
            reg_lc_form = RegisterLocationForm(request.POST)
            spn_opt_form = SponsorOptionForm(request.POST)
            reg_spn_form = RegisterSponsorForm()
            context = {
                'reg_trn_form': reg_trn_form,
                'reg_lc_form': reg_lc_form,
                'reg_spn_form': reg_spn_form,
                'spn_opt_form': spn_opt_form
            }
            messages.info(request, f'Enter Sponsor Information!')
            return render(request, 'tournament/registerTournament.html', context)

        # Execute if the tournament doesn't have a sponsor and all other details are valid
        elif spn_opt_form.is_valid() and spn_opt_form.cleaned_data.get(
                'hasSponsor') == 0 and reg_trn_form.is_valid() and reg_lc_form.is_valid():
            savedLocation = reg_lc_form.save()
            savedTournament = reg_trn_form.save()
            savedTournament.Location = savedLocation
            savedTournament.save()
            messages.success(request, f'Tournament has been saved!')
            return redirect('nfa-home')

        # Execute if the tournament does have a sponsor and all details are valid
        elif spn_opt_form.is_valid() and reg_trn_form.is_valid() and reg_lc_form.is_valid() and reg_spn_form.is_valid():
            savedLocation = reg_lc_form.save()
            savedSponsor = reg_spn_form.save()
            savedTournament = reg_trn_form.save()
            savedTournament.Location = savedLocation
            savedTournament.Sponsor = savedSponsor
            savedTournament.save()
            messages.success(request, f'Tournament has been saved!')
            return redirect('nfa-home')
        # Execute if any of the forms are not valid
        else:
            reg_trn_form = RegisterTournamentForm(request.POST)
            reg_lc_form = RegisterLocationForm(request.POST)
            spn_opt_form = SponsorOptionForm(request.POST)
            context = {
                'reg_trn_form': reg_trn_form,
                'reg_lc_form': reg_lc_form,
                'spn_opt_form': spn_opt_form
            }
            messages.error(request, "Tournament not saved! Please verify fields!")
            return render(request, 'tournament/registerTournament.html', context)
    # Execute if not a Post Request
    else:
        reg_trn_form = RegisterTournamentForm()
        reg_lc_form = RegisterLocationForm()
        spn_opt_form = SponsorOptionForm()
        context = {
            'reg_trn_form': reg_trn_form,
            'reg_lc_form': reg_lc_form,
            'spn_opt_form': spn_opt_form
        }
        return render(request, 'tournament/registerTournament.html', context)


@login_required
def registerTeam(request, pk):
    if request.method == 'POST':
        reg_team_form = RegisterTeamForm(request.POST)
        reg_trn_team_form = RegisterTournamentTeamForm(request.POST)
        spn_opt_form = SponsorOptionForm(request.POST)
        reg_spn_form = RegisterSponsorForm(request.POST)

        # Execute if team has a sponosor and sponsor form needs to be presented
        if spn_opt_form.is_valid() and spn_opt_form.cleaned_data.get('hasSponsor') == 1 and not reg_spn_form.is_valid():
            context = {
                'reg_team_form': reg_team_form,
                'reg_trn_team_form': reg_trn_team_form,
                'spn_opt_form': spn_opt_form,
                'reg_spn_form': reg_spn_form,
            }
            messages.info(request, f'Enter Sponsor Information!')
            return render(request, 'tournament/registerTeam.html', context)

        # Execute if the tournament doesn't have a sponsor and all other details are valid
        elif spn_opt_form.is_valid() and spn_opt_form.cleaned_data.get(
                'hasSponsor') == 0 and reg_team_form.is_valid() and reg_trn_team_form.is_valid():
            savedTeam = reg_team_form.save()
            savedTrnTeam = reg_trn_team_form.save(commit=False)
            savedTrnTeam.Tournament = Tournament.objects.filter(pk=pk).first()
            savedTrnTeam.Team = savedTeam
            savedTrnTeam.save()
            messages.success(request, f'Team has been saved!')
            return redirect('nfa-home')

        # Execute if there is a sponsor and all form are valid
        elif spn_opt_form.is_valid() and reg_team_form.is_valid() and reg_trn_team_form.is_valid():
            savedTeam = reg_team_form.save(commit=False)
            savedSponsor = reg_spn_form.save()
            savedTeam.Sponsor = savedSponsor
            savedTeam.save()

            savedTrnTeam = reg_trn_team_form.save(commit=False)
            savedTrnTeam.Tournament = Tournament.objects.filter(pk=pk).first()
            savedTrnTeam.Team = savedTeam
            savedTrnTeam.save()
            messages.success(request, f'Team has been saved!')

            numOfAng = reg_team_form.cleaned_data.get('Number_Of_Anglers')
            teamId = savedTeam.team_id
            reg_ang_form = RegisterAnglerForm()
            context = {
                'reg_ang_form': reg_ang_form,
                'numOfAng': numOfAng,
                'teamId': teamId
            }
            return redirect('nfa-home')

        # Execute if any form is invalid
        else:
            reg_team_form = RegisterTeamForm()
            context = {
                'reg_team_form': reg_team_form,
                'reg_trn_team_form': reg_trn_team_form,
                'spn_opt_form': spn_opt_form,
                'reg_spn_form': reg_spn_form,
            }
            messages.error(request, "Tournament not saved! Please verify fields!")
            return render(request, 'tournament/registerTeam.html', context)

    # Execute if not a POST request
    else:
        reg_team_form = RegisterTeamForm()
        reg_trn_team_form = RegisterTournamentTeamForm()
        spn_opt_form = SponsorOptionForm()
        context = {
            'reg_team_form': reg_team_form,
            'reg_trn_team_form': reg_trn_team_form,
            'spn_opt_form': spn_opt_form
        }
        return render(request, 'tournament/registerTeam.html', context)


@login_required
def registerAnglers(request, teamPK):
    if request.method == 'POST':
        reg_angler_form = RegisterAnglerForm(request.POST)
        if reg_angler_form.is_valid():
            savedAngler = reg_angler_form.save(commit=False)
            team = Team.objects.filter(team_id=teamPK).first()
            if team is None:
                context = {
                    'reg_angler_form': reg_angler_form
                }
                messages.error(request, "Angler not saved! Please verify fields!")
                return render(request, 'tournament/registerAnglers.html', context)
            savedAngler.Team = team
            if team.Sponsor:
                sponsor = team.Sponsor
                savedAngler.Sponsor = sponsor
            savedAngler.save()
            messages.success(request, f'Angler has been saved!')
            return redirect('ang-create', team.team_id)
        else:
            context = {
                'reg_angler_form': reg_angler_form
            }
            messages.error(request, "Angler not saved! Please verify fields!")
            return render(request, 'tournament/registerAnglers.html', context)
    else:
        reg_angler_form = RegisterAnglerForm()
        context = {
            'reg_angler_form': reg_angler_form
        }
        return render(request, 'tournament/registerAnglers.html', context)


class TeamListView(ListView):
    model = RegisteredTeam
    context_object_name = 'teams'

    def get_queryset(self):
        return RegisteredTeam.objects.filter(Tournament__in=Tournament.objects.filter(trn_id=self.kwargs['trnPK']))

    def get_context_data(self, **kwargs):
        context = super(TeamListView, self).get_context_data(**kwargs)
        registeredTeams = RegisteredTeam.objects.filter(
            Tournament__in=Tournament.objects.filter(trn_id=self.kwargs['trnPK']))
        context['anglers'] = Angler.objects.filter(Team__in=registeredTeams.values('Team'))
        # Add any other variables to the context here
        ...
        return context


class TeamDetailView(DetailView):
    model = RegisteredTeam


@login_required
def registerTrnOfficial(request, pk):
    if request.method == 'POST':
        reg_ofc_form = RegisterTrnOfficialForm(request.POST)
        if reg_ofc_form.is_valid():
            ofc = reg_ofc_form.save()
            trn = Tournament.objects.filter(trn_id=pk).first()
            trnOfc = TrnOfficial(Tournament=trn, Official=ofc)
            trnOfc.save()
            messages.success(request, f'You are now registered as an official!')
            return redirect('trn-detail', pk)
        else:
            context = {
                'reg_ofc_form': reg_ofc_form
            }
            messages.error(request, "Angler not saved! Please verify fields!")
            return render(request, 'tournament/registerOfficial.html', context)
    else:
        reg_ofc_form = RegisterTrnOfficialForm()
        context = {
            'reg_ofc_form': reg_ofc_form,
        }
        return render(request, 'tournament/registerOfficial.html', context)


@login_required
def createTrnRule(request, pk):
    if request.method == 'POST':
        create_trn_rule_form = CreateTournamentRuleForm(request.POST)
        if create_trn_rule_form.is_valid():
            enteredFish = create_trn_rule_form.cleaned_data['Fish']
            fish = Fish.objects.filter(Fish_Type=enteredFish).first()
            trn = Tournament.objects.filter(trn_id=pk).first()
            fishInDB = TournamentRule.objects.filter(Tournament=trn).filter(Fish=fish).first()
            if fishInDB is None:
                savedRule = create_trn_rule_form.save(commit=False)
                savedRule.Fish = fish
                savedRule.Tournament = trn
                savedRule.save()
                messages.success(request, f'Rule has been saved!')
                return redirect('trn-detail', pk)
            else:
                context = {
                    'create_trn_rule_form': create_trn_rule_form
                }
                messages.error(request, "Rule for this fish already exists!")
                return render(request, 'tournament/createRule.html', context)
        else:
            context = {
                'create_trn_rule_form': create_trn_rule_form
            }
            messages.error(request, "Rule not saved! Please verify fields!")
            return render(request, 'tournament/createRule.html', context)
    else:
        create_trn_rule_form = CreateTournamentRuleForm()
        context = {
            'create_trn_rule_form': create_trn_rule_form
        }
        return render(request, 'tournament/createRule.html', context)


class TrnRuleListView(ListView):
    model = TournamentRule
    template_name = 'tournament/rulesList.html'
    context_object_name = 'rules'

    def get_queryset(self):
        return TournamentRule.objects.filter(Tournament__in=Tournament.objects.filter(trn_id=self.kwargs['pk']))

    def get_context_data(self, **kwargs):
        context = super(TrnRuleListView, self).get_context_data(**kwargs)
        trn = Tournament.objects.filter(trn_id=self.kwargs['pk']).first()
        context['trn'] = trn
        # Add any other variables to the context here
        ...
        return context


@login_required
def enterCaughtFish(request, pk):
    if request.method == 'POST':
        c_fish_form = CaughtFishForm(pk, request.POST)
        if c_fish_form.is_valid():
            c_fish_form.save()
            messages.success(request, f'Fish has been recorded!')
            return redirect('trn-detail', pk)
        else:
            context = {
                'c_fish_form': c_fish_form
            }
            messages.error(request, "Fish not recorded! Please verify fields!")
            return render(request, 'tournament/caught_fish_form.html', context)
    else:
        c_fish_form = CaughtFishForm(pk)
        context = {
            'c_fish_form': c_fish_form
        }
        return render(request, 'tournament/caught_fish_form.html', context)


class CaughtFishListView(ListView):
    model = CaughtFish
    template_name = 'tournament/caught_fish_list.html'
    context_object_name = 'CaughtFish'

    def get_queryset(self):
        return CaughtFish.objects.filter(Tournament__in=Tournament.objects.filter(trn_id=self.kwargs['pk']))


def searchView(request):
    context = {}
    query = request.GET.get('q')
    if query:
        caughtFishResults = CaughtFish.objects.filter(
            Q(Fish__Fish_Type__icontains=query) |
            Q(Angler__First_Name__icontains=query) |
            Q(Angler__Last_Name__icontains=query) |
            Q(Tournament__Tournament_Name__icontains=query)
        ).distinct()

        anglerResults = Angler.objects.filter(
            Q(First_Name__icontains=query) |
            Q(Last_Name__icontains=query)
        ).distinct()

        tournamentResults = Tournament.objects.filter(
            Q(Tournament_Name__icontains=query) |
            Q(Tournament_Date__icontains=query) |
            Q(Sponsor__Sponsor_Name__icontains=query) |
            Q(Location__State__icontains=query) |
            Q(Location__Lake__icontains=query)
        ).distinct()

        teamResults = Team.objects.filter(
            Q(Team_Name__icontains=query)
        ).distinct()

    else:
        caughtFishResults = None
        anglerResults = None
        tournamentResults = None
        teamResults = None

    for result in caughtFishResults:
        queryset = [result]
        if queryset:
            context['CaughtFish'] = list(set(queryset))
        else:
            context['CaughtFish'] = None

    for result in anglerResults:
        queryset = [result]
        if queryset:
            context['Anglers'] = list(set(queryset))
        else:
            context['Anglers'] = None

    for result in tournamentResults:
        queryset = [result]
        if queryset:
            context['Tournaments'] = list(set(queryset))
        else:
            context['Tournaments'] = None

    for result in teamResults:
        queryset = [result]
        if queryset:
            context['Teams'] = list(set(queryset))
        else:
            context['Teams'] = None

    return render(request, 'tournament/searchResults.html', context)


def about(request):
    context = {
        'title': 'About'
    }
    return render(request, 'tournament/about.html', context)
