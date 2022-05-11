from statistics import mode
from django.db import models

# Create your models here.


class KebeleUserTest(models.Model):
    name = models.CharField(max_length=50)
    age = models.IntegerField()


class KebeleOfficialTest(models.Model):
    name = models.CharField(max_length=50)
    age = models.IntegerField()
