from email.policy import default
from multiprocessing.sharedctypes import Value
from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin)
from django.forms import ImageField


class Department(models.Model):
    name = models.CharField(max_length=255, unique=True, db_index=True)


class AccountManager(BaseUserManager):
    def _create_user(self, username, username_name, password=None,  is_official=False, is_staff=False, is_superuser=False,  **extra_fields):
        if not username_name:
            raise ValueError('The given username must be set')
        if not username:
            raise ValueError('user should have a kebele id')
        user = self.model(username=username, username_name=username_name, is_official=is_official, is_staff=is_staff, is_superuser=is_superuser,
                          **extra_fields)
        user.set_password(password)
        user.save(using=self.db)
        return user

    def create_user(self, username, username_name, password=None,  **extra_fields):
        return self._create_user(username, username_name=username_name, password=password,  is_official=False, ** extra_fields)

    def create_official(self, username, username_name, password=None, **extra_fields):
        extra_fields.setdefault('is_official', True)
        # if extra_fields.get(department) is None:
        #     raise ValueError('Kebele official should work under a department')

        return self._create_user(username, username_name=username_name, password=password,  **extra_fields)

    def create_superuser(self, username, username_name,  password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_official', True)
        extra_fields.setdefault('is_verified', True)
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(
                'Kebele Head or Admin must have is_superuser=True.')
        if extra_fields.get('is_staff') is not True:
            raise ValueError('Kebele Official must have is_staff=True.')
        if extra_fields.get('is_official') is not True:
            raise ValueError('Kebele Official must have is_official = True')
        if extra_fields.get('is_verified') is not True:
            raise ValueError('Kebele admin must not wait for verification')
        return self._create_user(
            username=username, username_name=username_name, password=password, is_staff=True,  is_official=True, is_superuser=True,)


class Account(AbstractBaseUser, PermissionsMixin):
    username_name = models.CharField(
        max_length=255, unique=False, db_index=True)
    username = models.CharField(max_length=255, unique=True)
    image = models.ImageField(
        upload_to='media/images/', max_length=100, default='default.jpg')
    is_verified = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # department = models.CharField('Department', max_length=255)
    # department = models.ForeignKey(
    #     'Department.name', on_delete=models.CASCADE, verbose_name='related departments', default=None)
    is_official = models.BooleanField(default=False)

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['username_name', 'is_official']

    objects = AccountManager()

    def __str__(self):
        return self.username
