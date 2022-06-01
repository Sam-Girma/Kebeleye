from django.urls import path
from .views import RegisterView

from . import views
urlpatterns = [
    path('register/kebeleuser/', RegisterView.as_view(), name="register"),
    path('register/kebeleofficial/', RegisterView.as_view(), name="register"),
]
