from django.urls import path
from .views import *
from . import views

urlpatterns = [
    path('', TrnListView.as_view(), name='nfa-home'),
    path('about/', views.about, name='nfa-about'),

    path('tournament/<int:pk>/', TrnDetailView.as_view(), name='trn-detail'),
    path('tournament/<int:pk>/delete/', TrnDeleteView.as_view(), name='trn-delete'),
    path('tournament/<int:pk>/update/', TrnUpdateView.as_view(), name='trn-update'),
    path('tournament/new', views.registerTournament, name='trn-create'),

    path('tournament/update/location/<int:pk>/', LocationUpdateView.as_view(), name='loc-update'),
    path('tournament/update/sponsor/<int:pk>/', SponsorUpdateView.as_view(), name='spn-update'),

    path('tournament/<int:pk>/new/team/', views.registerTeam, name='team-create'),
    path('tournament/team/<int:pk>/', TeamDetailView.as_view(), name='team-detail'),
    path('tournament/<int:trnPK>/team/', TeamListView.as_view(), name='team-list'),

    path('tournament/team/<int:teamPK>/new/angler', views.registerAnglers, name='ang-create'),

    path('tournament/<int:pk>/new/official', views.registerTrnOfficial, name='trn-ofc-create'),

    path('tournament/new/fish', FishCreate.as_view(), name='fish-create'),
    path('tournament/fish/<int:pk>/update/', FishCreate.as_view(), name='fish-update'),
    path('tournament/fish', FishListView.as_view(), name='fish-list'),

    path('tournament/<int:pk>/create/rule', views.createTrnRule, name='create-rule'),
    path('tournament/<int:pk>/rules', TrnRuleListView.as_view(), name='rule-list'),

    path('tournament/<int:pk>/new/caught/fish', views.enterCaughtFish, name='enter-caught-fish'),
    path('tournament/<int:pk>/caught/fish', CaughtFishListView.as_view(), name='caught-fish-list'),

    path('tournament/results/', views.searchView, name='search'),

]
