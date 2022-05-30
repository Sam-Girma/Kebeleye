from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import PermissionsMixin, BaseUserManager, AbstractBaseUser

from DjangoBackend.tracker.models import TrackingModel
# Create your models here.


class Account(AbstractBaseUser, PermissionsMixin, TrackingModel):
