<<<<<<< HEAD
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
=======
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
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
