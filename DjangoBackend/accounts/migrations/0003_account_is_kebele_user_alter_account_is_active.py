<<<<<<< HEAD
# Generated by Django 4.0.4 on 2022-06-04 05:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_rename_is_staff_account_is_admin'),
    ]

    operations = [
        migrations.AddField(
            model_name='account',
            name='is_kebele_user',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='account',
            name='is_active',
            field=models.BooleanField(default=True),
        ),
    ]
=======
# Generated by Django 4.0.4 on 2022-06-04 05:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_rename_is_staff_account_is_admin'),
    ]

    operations = [
        migrations.AddField(
            model_name='account',
            name='is_kebele_user',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='account',
            name='is_active',
            field=models.BooleanField(default=True),
        ),
    ]
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
