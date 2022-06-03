from django.urls import path
from .views import RegisterOfficialView, RegisterUserView, UserViewSet
from .views import LoginUserAPIView, LoginOfficialAPIView
from . import views
from rest_framework_simplejwt import views as jwt_views
urlpatterns = [
    path('register/kebeleuser/', RegisterUserView.as_view(), name="register"),
    path('register/kebeleofficial/',
         RegisterOfficialView.as_view(), name="register"),
    path('login/kebeleuser/', LoginUserAPIView.as_view(), name='kebeleuser'),
    path('login/kebeleofficial/',
         LoginOfficialAPIView.as_view(), name='kebeleofficial'),
    path('users/', UserViewSet.as_view({'get': 'list'}), name='users_list'),
    path('userdetail/',
         UserViewSet.as_view({'get': 'retrieve'}), name="userdetail"),
]
