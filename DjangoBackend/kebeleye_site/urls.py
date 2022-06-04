<<<<<<< HEAD
from django.contrib import admin
from django.urls import path, include
<<<<<<< HEAD
from django.conf.urls.static import static
from django.conf import settings
from accounts.views import LoginUserAPIView
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView,
)
=======

>>>>>>> main
urlpatterns = [
    path('login/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    path('login/token/create/', LoginUserAPIView.as_view(), name='login_token'),
    path('login/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('admin/', admin.site.urls),
<<<<<<< HEAD
    path('accounts/', include('accounts.urls')),
    path('post/', include('posts.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
=======
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from accounts.views import LoginUserAPIView
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView,
)
urlpatterns = [
    path('login/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    path('login/token/create/', LoginUserAPIView.as_view(), name='login_token'),
    path('login/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts.urls')),
    path('post/', include('posts.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
=======
    path('auth/', include('accounts.urls'))
]
>>>>>>> main
