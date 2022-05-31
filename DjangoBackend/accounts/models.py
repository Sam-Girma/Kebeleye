from django.db import models

# Create your models here.
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin)


class AccountManager(BaseUserManager):
    def _create_user(self, username, user_id, password=None, **extra_fields):
        if not username:
            raise ValueError('The given username must be set')
        if not user_id:
            raise ValueError('The given user id must be set')
        user = self.model(username=username,
                          user_id=user_id, **extra_fields)
        user.set_password(password)
        user.save(using=self.db)
        return user

    def create_user(self, username, user_id, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(username, user_id=user_id, password=password, **extra_fields)

    def create_staff(self, username, user_id, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        if extra_fields.get('is_staff') is not True:
            raise ValueError('Kebele Official must have is_staff=True.')
        return self._create_user(username, user_id=user_id, password=password, **extra_fields)

    def create_superuser(self, username, user_id, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_staff', True)
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(
                'Kebele Head or Admin must have is_superuser=True.')
        if extra_fields.get('is_staff') is not True:
            raise ValueError('Kebele Official must have is_staff=True.')
        return self._create_user(username, user_id=user_id, password=password, **extra_fields)


class Account(AbstractBaseUser, PermissionsMixin):
    """
   An abstract base class implementing a fully featured User model with
   admin-compliant permissions.

   Username and password are required. Other fields are optional.
   """
    username = models.CharField(max_length=255, unique=False, db_index=True)
    user_id = models.CharField(max_length=255, unique=True)
    is_verified = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # is_kebele_official = models.BooleanField(default=False)
    # is_kebele_user = models.BooleanField(default=False)

    USERNAME_FIELD = 'user_id'
    REQUIRED_FIELDS = ['username', 'is_kebele_user', 'is_kebele_official']

    objects = AccountManager()

    def __str__(self):
        return self.username

    def tokens(self):
        return ''
