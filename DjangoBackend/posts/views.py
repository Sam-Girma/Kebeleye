from posts.serializers import AnnouncementSerializer, FeedbackSerializer, ReportSerializer
from rest_framework.permissions import IsAuthenticated
# Create your views here.
from posts.models import Feedback
from posts.models import Announcement
from posts.models import Report
###########################################
from rest_framework import viewsets
from rest_framework import generics
from django.core.exceptions import PermissionDenied
from .permissions import IsOfficial, IsKebeleUser


class AnnoucementsListView(generics.ListCreateAPIView):
    # permission_classes = (IsAuthenticated,)
    serializer_class = AnnouncementSerializer
    queryset = Announcement.objects.all()


class AnnoucementOfficialView(viewsets.ModelViewSet):
    # permission_classes = (IsAuthenticated, IsOfficial)
    serializer_class = AnnouncementSerializer
    queryset = Announcement.objects.all()


class FeedbacksListView(generics.ListCreateAPIView):
    # permission_classes = (IsAuthenticated,)
    serializer_class = AnnouncementSerializer
    queryset = Announcement.objects.all()


class FeedbackUserView(viewsets.ModelViewSet):
    # permission_classes = (IsAuthenticated, IsKebeleUser)
    serializer_class = FeedbackSerializer
    queryset = Feedback.objects.all()


class ReportsListView(generics.ListCreateAPIView):
    # permission_classes = (IsAuthenticated,)
    serializer_class = AnnouncementSerializer
    queryset = Announcement.objects.all()


class ReportUserView(viewsets.ModelViewSet):
    # permission_classes = (IsAuthenticated, IsKebeleUser)
    serializer_class = ReportSerializer
    queryset = Report.objects.all()
