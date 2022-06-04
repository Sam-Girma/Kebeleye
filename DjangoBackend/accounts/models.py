from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin)
from django.forms import ImageField


class AccountManager(BaseUserManager):
    def _create_user(self, username, username_name, password=None,  is_official=False, department=None, is_active=False, is_kebele_user=True, is_staff=False, is_superuser=False, is_admin=False,  **extra_fields):
        if not username_name:
            raise ValueError('The given username must be set')
        if not username:
            raise ValueError('user should have a kebele id')
        if is_official == True and is_superuser == False:
            is_active = False
            is_kebele_user = False
        user = self.model(username=username, username_name=username_name, is_official=is_official, is_admin=is_admin, is_active=is_active, is_staff=is_staff, department=department, is_superuser=is_superuser,
                          **extra_fields)
        user.set_password(password)
        user.save(using=self.db)
        return user

    def create_user(self, username, username_name, password=None, department=None, is_official=False, is_kebele_user=True,  **extra_fields):
        return self._create_user(username, username_name=username_name, password=password,  is_official=is_official, is_kebele_user=is_kebele_user, department=department, ** extra_fields)

    # def create_official(self, username, username_name, password=None, department=None, **extra_fields):
    #     extra_fields.setdefault('is_official', True)
    #     # if extra_fields.get(department) is None:
    #     #     raise ValueError('Kebele official should work under a department')
    #     return self._create_user(username, username_name=username_name, password=password, department=department, ** extra_fields)

    def create_superuser(self, username, username_name,  password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_official', True)
        extra_fields.setdefault('is_active', True),
        extra_fields.setdefault('is_staff', True),
        extra_fields.setdefault('is_admin', True),
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(
                'Kebele Head or Admin must have is_superuser=True.')
        if extra_fields.get('is_active') is not True:
            raise ValueError('Kebele Admin must have is_active=True.')
        if extra_fields.get('is_official') is not True:
            raise ValueError('Kebele Admin must have is_official = True')
        if extra_fields.get('is_admin') is not True:
            raise ValueError('Kebele admin must be admin')
        if extra_fields.get('is_staff') is not True:
            raise ValueError('Kebele admin must be admin')
        return self._create_user(
            username=username, username_name=username_name, password=password, is_active=True, is_admin=True, is_staff=True,  is_official=True,  is_superuser=True,)


class Account(AbstractBaseUser, PermissionsMixin):
    username_name = models.CharField(
        max_length=255, unique=False, db_index=True)
    username = models.CharField(max_length=255, unique=True)
    image = models.ImageField(
        upload_to='media/images/', max_length=100, default='default.jpg')
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    department = models.CharField(max_length=200, default=None, null=True)
    is_official = models.BooleanField(default=False)
    is_kebele_user = models.BooleanField(default=True)
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['username_name', 'is_official']

    objects = AccountManager()

    def __str__(self):
        return self.username
