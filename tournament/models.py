# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.urls import reverse


class Angler(models.Model):
    ang_id = models.AutoField(db_column='ANG_ID', primary_key=True)  # Field name made lowercase.
    First_Name = models.CharField(db_column='ANG_FNAME', max_length=45)  # Field name made lowercase.
    Last_Name = models.CharField(db_column='ANG_LNAME', max_length=45)  # Field name made lowercase.
    Date_Of_Birth = models.DateField(db_column='ANG_DOB')  # Field name made lowercase.
    Team = models.ForeignKey('Team', models.DO_NOTHING, db_column='TEAM_ID')  # Field name made lowercase.
    Sponsor = models.ForeignKey('Sponsor', models.DO_NOTHING, db_column='SPONS_ID', blank=True,
                                null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'angler'

    def get_absolute_url(self):
        return reverse('ang-create', kwargs={'pk': self.pk})

    def __str__(self):
        return self.First_Name + " " + self.Last_Name


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class CaughtFish(models.Model):
    Caught_Fish_Id = models.AutoField(db_column='C_FISH_ID', primary_key=True)  # Field nam
    Tournament = models.ForeignKey('Tournament', models.DO_NOTHING, db_column='TRN_ID', unique=False)  # Field name made lowercase.
    Team = models.ForeignKey('Team', models.DO_NOTHING, db_column='TEAM_ID')  # Field name made lowercase.
    Angler = models.ForeignKey(Angler, models.DO_NOTHING, db_column='ANG_ID')  # Field name made lowercase.
    Fish = models.ForeignKey('Fish', models.DO_NOTHING, db_column='FISH_ID')  # Field name made lowercase.
    Date_Caught = models.DateTimeField(db_column='C_DATE', auto_now=True)  # Field name made lowercase.
    Fish_Length = models.DecimalField(db_column='C_FISH_LEN', max_digits=10,
                                      decimal_places=2)  # Field name made lowercase.
    Fish_Weight = models.DecimalField(db_column='C_FISH_WGT', max_digits=10,
                                      decimal_places=2)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'caught_fish'
        unique_together = (('Tournament', 'Team', 'Angler', 'Fish', 'Date_Caught'),)




class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Fish(models.Model):
    fish_id = models.AutoField(db_column='FISH_ID', primary_key=True)  # Field name made lowercase.
    Fish_Type = models.CharField(db_column='FISH_TYPE', max_length=45, unique=True)  # Field name made lowercase.
    Average_Fish_Length = models.DecimalField(db_column='FISH_AVG_LEN', max_digits=10, decimal_places=2, blank=True,
                                              null=True)  # Field name made lowercase.
    Average_Fish_Weight = models.DecimalField(db_column='FISH_AVG_WGT', max_digits=10, decimal_places=2, blank=True,
                                              null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'fish'

    def get_absolute_url(self):
        return reverse('fish-list')

    def __str__(self):
        return self.Fish_Type


class Location(models.Model):
    loc_id = models.AutoField(db_column='LOC_ID', primary_key=True)  # Field name made lowercase.
    State = models.CharField(db_column='LOC_STATE', max_length=2)  # Field name made lowercase.
    County = models.CharField(db_column='LOC_COUNTY', max_length=40)  # Field name made lowercase.
    Lake = models.CharField(db_column='LOC_LAKE', max_length=40)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'location'

    def get_absolute_url(self):
        return reverse('nfa-home')


class Official(models.Model):
    ofc_id = models.AutoField(db_column='OFC_ID', primary_key=True)  # Field name made lowercase.
    First_Name = models.CharField(db_column='OFC_FNAME', max_length=45)  # Field name made lowercase.
    Last_Name = models.CharField(db_column='OFC_LNAME', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'official'

    def __str__(self):
        return self.First_Name + " " + self.Last_Name


class RegisteredTeam(models.Model):
    RegTeam_ID = models.AutoField(db_column='REG_TEAM_ID', primary_key=True)  # Field nam
    Tournament = models.OneToOneField('Tournament', models.DO_NOTHING, db_column='TRN_ID',
                                      unique=False)  # Field name made lowercase.
    Team = models.ForeignKey('Team', models.DO_NOTHING, db_column='TEAM_ID')  # Field name made lowercase.
    Register_Date = models.DateTimeField(db_column='REG_DATE', blank=True, null=True,
                                         auto_now=True)  # Field name made lowercase.
    Paid_Status = models.CharField(db_column='REG_PAID_STATUS', max_length=1)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'registered_team'
        unique_together = (('Tournament', 'Team'),)


class Sponsor(models.Model):
    spons_id = models.AutoField(db_column='SPONS_ID', primary_key=True)  # Field name made lowercase.
    Sponsor_Name = models.CharField(db_column='SPONS_NAME', max_length=45)  # Field name made lowercase.
    Sponsor_Tier = models.IntegerField(db_column='SPONS_TIER', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'sponsor'

    # used to redirect after an update
    def get_absolute_url(self):
        return reverse('nfa-home')


class Team(models.Model):
    team_id = models.AutoField(db_column='TEAM_ID', primary_key=True)  # Field name made lowercase.
    Team_Name = models.CharField(db_column='TEAM_NAME', max_length=45)  # Field name made lowercase.
    Team_Owner = models.CharField(db_column='TEAM_OWNER', max_length=45, blank=True,
                                  null=True)  # Field name made lowercase.
    Sponsor = models.ForeignKey(Sponsor, models.DO_NOTHING, db_column='SPONS_ID', blank=True,
                                null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'team'

    def get_absolute_url(self):
        return reverse('team-detail', kwargs={'pk': self.pk})

    def __str__(self):
        return self.Team_Name


class Tournament(models.Model):
    trn_id = models.AutoField(db_column='TRN_ID', primary_key=True)  # Field name made lowercase.
    Tournament_Name = models.CharField(db_column='TRN_NAME', max_length=45)  # Field name made lowercase.
    Tournament_Date = models.DateField(db_column='TRN_DATE', blank=True, null=True)  # Field name made lowercase.
    Location = models.ForeignKey(Location, models.DO_NOTHING, db_column='LOC_ID', blank=True,
                                 null=True)  # Field name made lowercase.
    Sponsor = models.ForeignKey(Sponsor, models.DO_NOTHING, db_column='SPONS_ID', blank=True,
                                null=True)  # Field name made lowercase.
    Tournament_Entry_Fee = models.DecimalField(db_column='TRN_ENTRY_FEE', max_digits=9, decimal_places=2, blank=True,
                                               null=True)  # Field name made lowercase.
    Tournament_First_Prize = models.DecimalField(db_column='TRN_FIRST_PRIZE', max_digits=9, decimal_places=2,
                                                 blank=True, null=True)  # Field name made lowercase.
    Tournament_Second_Prize = models.DecimalField(db_column='TRN_SECOND_PRIZE', max_digits=9, decimal_places=2,
                                                  blank=True, null=True)  # Field name made lowercase.
    Tournament_Third_Prize = models.DecimalField(db_column='TRN_THIRD_PRIZE', max_digits=9, decimal_places=2,
                                                 blank=True, null=True)  # Field name made lowercase.rcase.

    class Meta:
        managed = False
        db_table = 'tournament'

    # used to redirect after an update
    def get_absolute_url(self):
        return reverse('trn-detail', kwargs={'pk': self.pk})

    def __str__(self):
        return self.Tournament_Name


class TournamentRule(models.Model):
    Trn_Rule_Id = models.AutoField(db_column='TRN_RULE_ID', primary_key=True)  # Field nam
    Tournament = models.OneToOneField(Tournament, models.DO_NOTHING, db_column='TRN_ID')  # Field name made lowercase.
    Fish = models.OneToOneField(Fish, models.DO_NOTHING, db_column='FISH_ID')  # Field name made lowercase.
    Minimum_Fish_Length = models.DecimalField(db_column='MIN_FISH_LEN', max_digits=10, decimal_places=2, blank=True,
                                              null=True)  # Field name made lowercase.
    Minimum_Fish_Weight = models.DecimalField(db_column='MIN_FISH_WEIGHT', max_digits=10, decimal_places=2, blank=True,
                                              null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tournament_rule'
        unique_together = (('Tournament', 'Fish'),)


class TrnOfficial(models.Model):
    Trn_Ofc_Id = models.AutoField(db_column='TRN_OFC_ID', primary_key=True)  # Field nam
    Tournament = models.OneToOneField(Tournament, models.DO_NOTHING, db_column='TRN_ID')  # Field name made lowercase.
    Official = models.ForeignKey(Official, models.DO_NOTHING, db_column='OFC_ID')  # Field name made lowercase.
    trn_official_uname = models.CharField(db_column='TRN_OFFICIAL_UNAME', max_length=45,
                                          null=True)  # Field name made lowercase.
    trn_official_pword = models.CharField(db_column='TRN_OFFICIAL_PWORD', max_length=45,
                                          null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'trn_official'
        unique_together = (('Tournament', 'Official'),)

    def get_absolute_url(self):
        return reverse('trn-detail', kwargs={'pk': self.Tournament.trn_id})


class UsersProfile(models.Model):
    image = models.CharField(max_length=100)
    user = models.OneToOneField(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_profile'
