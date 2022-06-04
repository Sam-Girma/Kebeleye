<<<<<<< HEAD

from rest_framework.response import Response
from accounts.models import Account
from .serializers import AccountSerializer, LoginUserSerializer, OfficialDetailsSerializer, RegisterUserSerializer, UserDetailsSerializer
from rest_framework import generics, status
from rest_framework import permissions
from rest_framework import viewsets
from rest_auth.views import LoginView
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from django.contrib.auth import get_user_model
from rest_framework_simplejwt.views import (

    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView,
)
# Create your views here.


# class RegisterOfficialView(generics.GenericAPIView):
#     serializer_class = RegisterOfficialSerializer

#     def post(self, request):
#         user = request.data
#         serializer = self.serializer_class(data=user)
#         if serializer.is_valid():
#             user_data = serializer.validated_data
#             serializer.save()
#             return Response(user_data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class RegisterUserView(generics.GenericAPIView):

    serializer_class = RegisterUserSerializer

    def post(self, request):
        user = request.data
        serializer = self.serializer_class(data=user)
        if serializer.is_valid():
            user_data = serializer.validated_data
            serializer.save()
            return Response(user_data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserViewSet(viewsets.ModelViewSet):
    queryset = get_user_model().objects.all()
    serializer_class = UserDetailsSerializer
    permission_classes = [permissions.IsAdminUser]


class OfficialViewSet(viewsets.ModelViewSet):
    queryset = get_user_model().objects.all()
    serializer_class = OfficialDetailsSerializer
    permission_classes = [permissions.IsAdminUser]


class AccountViewSet(viewsets.ModelViewSet):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    permission_classes = [permissions.IsAuthenticated]

    def list(self, request):

        if(request.user.is_admin):
            return super().list(request)

        instance = Account.objects.get(user=request.user)
        return Response(
            self.serializer_class(instance).data
        )


class LoginUserAPIView(TokenObtainPairView):
    serializer_class = LoginUserSerializer
=======

from rest_framework.response import Response
from accounts.models import Account
from .serializers import AccountSerializer, LoginUserSerializer, OfficialDetailsSerializer, RegisterUserSerializer, UserDetailsSerializer
from rest_framework import generics, status
from rest_framework import permissions
from rest_framework import viewsets
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from django.contrib.auth import get_user_model
from rest_framework_simplejwt.views import (

    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView,
)
# Create your views here.


# class RegisterOfficialView(generics.GenericAPIView):
#     serializer_class = RegisterOfficialSerializer

#     def post(self, request):
#         user = request.data
#         serializer = self.serializer_class(data=user)
#         if serializer.is_valid():
#             user_data = serializer.validated_data
#             serializer.save()
#             return Response(user_data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class RegisterUserView(generics.GenericAPIView):

    serializer_class = RegisterUserSerializer

    def post(self, request):
        user = request.data
        serializer = self.serializer_class(data=user)
        if serializer.is_valid():
            user_data = serializer.validated_data
            serializer.save()
            return Response(user_data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserViewSet(viewsets.ModelViewSet):
    queryset = get_user_model().objects.all()
    serializer_class = UserDetailsSerializer
    permission_classes = [permissions.IsAdminUser]


class OfficialViewSet(viewsets.ModelViewSet):
    queryset = get_user_model().objects.all()
    serializer_class = OfficialDetailsSerializer
    permission_classes = [permissions.IsAdminUser]


class AccountViewSet(viewsets.ModelViewSet):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    permission_classes = [permissions.IsAuthenticated]

    def list(self, request):

        if(request.user.is_admin):
            return super().list(request)

        instance = Account.objects.get(user=request.user)
        return Response(
            self.serializer_class(instance).data
        )


class LoginUserAPIView(TokenObtainPairView):
    serializer_class = LoginUserSerializer
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
