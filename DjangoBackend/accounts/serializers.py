from asyncore import write
from unittest.util import _MAX_LENGTH
from rest_framework import serializers
from .models import Account


class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)

    class Meta:
        model = Account
        fields = ['username', 'user_id', 'password']

    def validate(self, attrs):
        username = attrs.get('username', '')
        user_id = attrs.get('user_id', '')

        if not username.isalnum():
            raise serializers.ValidationError(
                'The username should only contain alphanumeric characters.')
        return attrs

    def create(self, validated_data):
        return Account.objects.create_user(**validated_data)
