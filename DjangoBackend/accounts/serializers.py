import re
from rest_framework import serializers, status
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from .models import Account
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView


class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = '__all__'


class RegisterUserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)

    class Meta:
        model = Account
        fields = ['username', 'username_name', 'password']

    def validate(self, attrs):
        username_name = attrs.get('username_name', '')
        alphaSpaces = r'^[a-zA-Z ]+$'
        if not re.match(alphaSpaces, username_name):
            raise serializers.ValidationError(
                'The username should only contain alpha characters.')
        return attrs

    def create(self, validated_data):
        return Account.objects.create_user(**validated_data)


class RegisterOfficialSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)

    class Meta:
        model = Account
        fields = ['username', 'username_name', 'password']

    def validate(self, attrs):
        username_name = attrs.get('username_name', '')
        alphaSpaces = r'^[a-zA-Z ]+$'
        if not re.match(alphaSpaces, username_name):
            raise serializers.ValidationError(
                'The username should only contain alpha characters.')
        return attrs

    def create(self, validated_data):
        return Account.objects.create_official(**validated_data)


class LoginUserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        write_only=True, max_length=70, min_length=6,)

    def validate(self, attrs):
        if Account.is_official == True:
            raise serializers.ValidationError(
                'This page is for officials only')

    class Meta:
        model = Account
        fields = ['username', 'username_name', 'password']


class LoginOfficialSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        write_only=True, max_length=70, min_length=6,)

    def validate(self, attrs):
        if Account.is_official == False:
            raise serializers.ValidationError(
                'This page is for officials only')

    class Meta:
        model = Account
        fields = ['user_id', 'username', 'password']


class UserTokenLoginSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        user = authenticate(
            username=attrs['username'], password=attrs['password'])

        if user is not None:
            print('in again####################################')
            data = super().validate(attrs)
            token = self.get_token(user=user)
            data['username'] = str(self.user)
            try:
                data['password'] = str(user.password)
                data['is_official'] = self.user.is_official
                userobj = Account.objects.get(username=self.user)
                data['username_name'] = userobj.username_name
            except Exception as e:
                raise serializers.ValidationError('Something Wrong')
            return data
        else:
            return serializers.ValidationError('Account is not here')
