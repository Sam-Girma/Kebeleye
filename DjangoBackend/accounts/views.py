from django.shortcuts import get_object_or_404
from rest_framework.permissions import AllowAny
from django.contrib.auth import authenticate
from rest_framework.response import Response
from .serializers import AccountSerializer, RegisterOfficialSerializer, RegisterUserSerializer, UserTokenLoginSerializer
from .serializers import LoginOfficialSerializer, LoginUserSerializer
from accounts.models import Account
from rest_framework import generics, status
from rest_framework import permissions
from rest_framework import viewsets
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework_simplejwt.views import TokenObtainPairView
# Create your views here.


class UserViewSet(viewsets.ModelViewSet):
    serializer_class = AccountSerializer
    queryset = Account.objects.all()


class RegisterOfficialView(generics.GenericAPIView):
    serializer_class = RegisterOfficialSerializer
    # permission_classes = [permissions.IsAuthenticated]

    def post(self, request):
        user = request.data
        serializer = self.serializer_class(data=user)
        if serializer.is_valid():
            user_data = serializer.validated_data
            serializer.save()
            return Response(user_data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class RegisterUserView(generics.GenericAPIView):

    serializer_class = RegisterUserSerializer
    # permission_classes = [permissions.IsAuthenticated]

    def post(self, request):
        user = request.data
        serializer = self.serializer_class(data=user)
        if serializer.is_valid():
            user_data = serializer.validated_data
            serializer.save()
            return Response(user_data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class LoginUserAPIView(TokenObtainPairView):
    serializer_class = UserTokenLoginSerializer
    # # permission_classes = (permissions.IsAuthenticated,)

    # def post(self, request):
    #     user_id = request.data.get('user_id', None)
    #     password = request.data.get('password', None)
    #     user = authenticate(user_id=user_id, password=password)
    #     if user:
    #         serializer = self.serializer_class(user)
    #         # serializer.is_valid(raise_exception=True)
    #         return Response(serializer.data, status=status.HTTP_200_OK)
    #     return Response({'message: Invalid Credentials, try again'}, status=status.HTTP_401_UNAUTHORIZED)


class LoginOfficialAPIView(TokenObtainPairView):
    serializer_class = LoginOfficialSerializer
    # permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        user_id = request.data.get('user_id', None)
        password = request.data.get('password', None)
        user = authenticate(user_id=user_id, password=password)
        if user:
            serializer = self.serializer_class(user)
            # serializer.is_valid(raise_exception=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response({'message: Invalid Credentials, try again'}, status=status.HTTP_401_UNAUTHORIZED)
