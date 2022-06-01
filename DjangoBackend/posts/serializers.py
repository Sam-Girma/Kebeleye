from dataclasses import fields
from rest_framework import serializers
from .models import Post


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        modesl = Post
        fields = '__all__'
