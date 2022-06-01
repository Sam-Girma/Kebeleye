from django.db import models
from accounts.models import Account
# Create your models here.


class Post(models.Model):
    post = models.CharField(max_length=1000)
    user = models.ForeignKey(Account, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_announcement = models.BooleanField(default=False)
    is_report = models.BooleanField(default=False)
    is_feedback = models.BooleanField(default=False)
