<<<<<<< HEAD
from rest_framework import serializers
from .models import Announcement, Feedback, Report


class AnnouncementSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Announcement
        fields = '__all__'


class FeedbackSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Feedback
        fields = '__all__'


class ReportSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Report
        fields = '__all__'
=======
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
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
