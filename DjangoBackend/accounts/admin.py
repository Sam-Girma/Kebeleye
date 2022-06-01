from django.contrib import admin

# Register your models here.
from . import models


class UserAdmin(admin.ModelAdmin):
    list_display = (
        "username",
        "user_id",
        "is_staff",
        "is_superuser",
    )


admin.site.register(models.Account, UserAdmin)
