<<<<<<< HEAD
<<<<<<< HEAD
from pyexpat import model
import re
from wsgiref import validate
from rest_framework import serializers, status
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from .models import Account
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework_simplejwt.authentication import InvalidToken

from django.contrib.auth import get_user_model


class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = '__all__'


class RegisterUserSerializer(serializers.ModelSerializer):
=======
from asyncore import write
from unittest.util import _MAX_LENGTH
from rest_framework import serializers
from .models import Account


class RegisterSerializer(serializers.ModelSerializer):
>>>>>>> main
    password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)

    class Meta:
        model = Account
<<<<<<< HEAD
        fields = ['username', 'username_name',
                  'password', 'is_official', 'department']

    def validate(self, attrs):
        username_name = attrs.get('username_name', '')
        alphaSpaces = r'^[a-zA-Z ]+$'
        if not re.match(alphaSpaces, username_name):
            raise serializers.ValidationError(
                'The username should only contain alpha characters.')
=======
        fields = ['username', 'user_id', 'password']

    def validate(self, attrs):
        username = attrs.get('username', '')
        user_id = attrs.get('user_id', '')

        if not username.isalnum():
            raise serializers.ValidationError(
                'The username should only contain alphanumeric characters.')
>>>>>>> main
        return attrs

    def create(self, validated_data):
        return Account.objects.create_user(**validated_data)
<<<<<<< HEAD


class UserDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ('pk', 'username', 'username_name',
                  'is_official')
        read_only_fields = ('username',)


class OfficialDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ('pk', 'username', 'username_name',
                  'is_official', 'is_active', 'department')
        read_only_fields = ('username',)


class LoginUserSerializer(TokenObtainPairSerializer):
    class Meta:
        model = Account
        fields = ['username', 'password', 'is_official', 'username_name']

    def validate(self, attr):
        user = authenticate(
            username=attr['username'], password=attr['password'])
        if user is not None:
            data = super().validate(attr)
            token = self.get_token(self.user)
            try:
                data['username'] = str(self.user)
                data['id'] = str(self.user.id)
                data['is_official'] = str(self.user.is_official)
                userobj = Account.objects.get(username=self.user)
            except Exception as e:
                raise serializers.ValidationError('Something Wrong')
            return data
        else:
            raise serializers.ValidationError('Account is not here')
=======
from pyexpat import model
import re
from wsgiref import validate
from rest_framework import serializers, status
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from .models import Account
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework_simplejwt.authentication import InvalidToken

from django.contrib.auth import get_user_model


class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = '__all__'


class RegisterUserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)

    class Meta:
        model = Account
        fields = ['username', 'username_name',
                  'password', 'is_official', 'department']

    def validate(self, attrs):
        username_name = attrs.get('username_name', '')
        alphaSpaces = r'^[a-zA-Z ]+$'
        if not re.match(alphaSpaces, username_name):
            raise serializers.ValidationError(
                'The username should only contain alpha characters.')
        return attrs

    def create(self, validated_data):
        return Account.objects.create_user(**validated_data)


class UserDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ('pk', 'username', 'username_name',
                  'is_official')
        read_only_fields = ('username',)


class OfficialDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ('pk', 'username', 'username_name',
                  'is_official', 'is_active', 'department')
        read_only_fields = ('username',)


class LoginUserSerializer(TokenObtainPairSerializer):
    class Meta:
        model = Account
        fields = ['username', 'password', 'is_official', 'username_name']

    def validate(self, attr):
        user = authenticate(
            username=attr['username'], password=attr['password'])
        if user is not None:
            data = super().validate(attr)
            token = self.get_token(self.user)
            try:
                data['username'] = str(self.user)
                data['id'] = str(self.user.id)
                data['is_official'] = str(self.user.is_official)
                userobj = Account.objects.get(username=self.user)
            except Exception as e:
                raise serializers.ValidationError('Something Wrong')
            return data
        else:
            raise serializers.ValidationError('Account is not here')
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
=======
>>>>>>> main
