import re
from rest_framework import serializers
from .models import Account
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer


class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)

    class Meta:
        model = Account
        fields = ['username', 'user_id', 'password', 'is_official']

    def validate(self, attrs):
        user_id = attrs.get('user_id', '')
        alphaSpaces = r'^[a-zA-Z ]+$'
        username = attrs.get('username', '')
        if not re.match(alphaSpaces, username):
            raise serializers.ValidationError(
                'The username should only contain alpha characters.')
        return attrs

    def create(self, validated_data):
        return Account.objects.create_user(**validated_data)


# class LoginSerializer(serializers.ModelSerializer):
#     password = serializers.CharField(write_only=True)
#     class Meta:
#         model = Account
#         fields = ['username', 'user_id', 'password', 'is_official']
#     def validate(self, attrs):
#         user_id = attrs.get()
# class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
#     @class
