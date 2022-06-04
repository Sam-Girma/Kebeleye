from django import urls
from django.urls import include, path

from .views import AccountViewSet, OfficialViewSet, RegisterUserView, UserViewSet
from . import views
from rest_framework.routers import SimpleRouter
router = SimpleRouter()
router.register('users', UserViewSet,)
router.register('officials', OfficialViewSet,)
router.register('accounts', AccountViewSet,)

urlpatterns = [
    path('register/user/', RegisterUserView.as_view(), name="register"),
    path('api/', include((router.urls, 'app_name'), namespace='instance_name'))
]
