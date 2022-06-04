from rest_framework import serializers
from .models import Announcement, Feedback, Report


class AnnouncementSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        modesl = Announcement
        fields = '__all__'


class FeedbackSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        modesl = Feedback
        fields = '__all__'


class ReportSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        modesl = Report
        fields = '__all__'
