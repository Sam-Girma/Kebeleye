<<<<<<< HEAD
from django.db import models

from accounts.models import Account

# Create your models here.


class Announcement(models.Model):
    post = models.CharField(max_length=10000)
    official = models.ForeignKey(Account, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Feedback(models.Model):
    post = models.CharField(max_length=10000)
    user = models.ForeignKey(
        Account, related_name="userswithfeedbacks", on_delete=models.CASCADE, max_length=255, null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    official = models.ForeignKey(
        Account, related_name="officialswithfeedbacks", on_delete=models.CASCADE, null=False)


class Report(models.Model):
    post = models.CharField(max_length=10000)
    user = models.ForeignKey(
        Account, related_name="userswithreports", on_delete=models.CASCADE, null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    official = models.ForeignKey(
        Account, related_name="officialsreported", on_delete=models.CASCADE, null=False)
=======
from django.db import models

from accounts.models import Account

# Create your models here.


class Announcement(models.Model):
    post = models.CharField(max_length=10000)
    official = models.ForeignKey(Account, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Feedback(models.Model):
    post = models.CharField(max_length=10000)
    user = models.ForeignKey(
        Account, related_name="userswithfeedbacks", on_delete=models.CASCADE, max_length=255, null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    official = models.ForeignKey(
        Account, related_name="officialswithfeedbacks", on_delete=models.CASCADE, null=False)


class Report(models.Model):
    post = models.CharField(max_length=10000)
    user = models.ForeignKey(
        Account, related_name="userswithreports", on_delete=models.CASCADE, null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    official = models.ForeignKey(
        Account, related_name="officialsreported", on_delete=models.CASCADE, null=False)
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
