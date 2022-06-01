from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin)


class Department(models.Model):
    name = models.CharField(max_length=255, unique=True, db_index=True)


class AccountManager(BaseUserManager):
    def _create_user(self, username, user_id, password=None, is_active=False, is_official=False, is_staff=False, is_superuser=False,  **extra_fields):
        if not username:
            raise ValueError('The given username must be set')
        if not user_id:
            raise ValueError('user should have a kebele id')
        user = self.model(username=username, user_id=user_id, is_official=is_official, is_staff=is_staff, is_active=is_active, is_superuser=is_superuser,
                          **extra_fields)
        user.set_password(password)
        user.save(using=self.db)
        return user

    def create_user(self, username, user_id, password=None, **extra_fields):
        return self._create_user(username, user_id=user_id, password=password, is_official=False, ** extra_fields)

    def create_official(self, username, user_id, password=None, **extra_fields):
        extra_fields.setdefault('is_official', True)

        return self._create_user(username, user_id=user_id, password=password, is_official=True, **extra_fields)

    def create_superuser(self, username, user_id,  password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_official', True)
        extra_fields.setdefault('is_active', True)
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(
                'Kebele Head or Admin must have is_superuser=True.')
        if extra_fields.get('is_staff') is not True:
            raise ValueError('Kebele Official must have is_staff=True.')
        if extra_fields.get('is_official') is not True:
            raise ValueError('Kebele Official must have is_official = True')
        return self._create_user(
            username=username, user_id=user_id, password=password, is_staff=True, is_superuser=True, is_active=True)


class Account(AbstractBaseUser, PermissionsMixin):
    """
   An abstract base class implementing a fully featured User model with
   admin-compliant permissions.

   Username and password are required. Other fields are optional.
   """
    username = models.CharField(max_length=255, unique=False, db_index=True)
    # email = models.EmailField(max_length=255, unique=True)
    # image = models.ImageField()
    user_id = models.CharField(max_length=255, unique=True)
    is_verified = models.BooleanField(default=False)
    is_active = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # department = models.ForeignKey(
    #     Department, on_delete=models.CASCADE, verbose_name='related departments')
    is_official = models.BooleanField(default=False)
    # is_kebele_user = models.BooleanField(default=False)

    USERNAME_FIELD = 'user_id'
    REQUIRED_FIELDS = ['username', 'is_official']

    objects = AccountManager()

    def __str__(self):
        return self.username

    def tokens(self):
        return ''
