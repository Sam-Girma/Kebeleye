from xml.etree.ElementInclude import include
from django.urls import path, include
from . import views
from rest_framework import routers
from .views import AnnoucementsListView, FeedbacksListView, ReportsListView

router = routers.SimpleRouter()
router.register('annouce', viewset=views.AnnoucementOfficialView)
router.register('feedback', viewset=views.FeedbackUserView)
router.register('report', viewset=views.ReportUserView)
urlpatterns = router.urls

urlpatterns += [
    path('announcements/', AnnoucementsListView.as_view(),
         name='announcement_list'),
    path('feedbacks/', FeedbacksListView.as_view(), name='feedback_list'),
    path('reports/', ReportsListView.as_view(), name='report_list'),
]
