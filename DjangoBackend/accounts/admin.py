from django.contrib import admin

from . import models


class UserAdmin(admin.ModelAdmin):
    list_display = (
        "username",
        "username_name",
        "is_staff",
        "is_superuser",
    )


admin.site.register(models.Account, UserAdmin)
