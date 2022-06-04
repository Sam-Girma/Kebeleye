<<<<<<< HEAD
<<<<<<< HEAD
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
=======
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
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
=======
from django.urls import path
from .views import RegisterView

urlpatterns = [
    path('register/kebeleuser', RegisterView.as_view(), name="register"),
    path('register/kebeleofficial', RegisterView.as_view(), name="register")
]
>>>>>>> main
