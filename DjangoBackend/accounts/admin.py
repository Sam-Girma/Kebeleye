from email.headerregistry import Group
from django.contrib import admin

from . import models


class UserAdmin(admin.ModelAdmin):
    list_display = (
        "username",
        "username_name",
        'is_admin',
        "is_superuser",
        'is_official',
    )


admin.site.register(models.Account, UserAdmin)
