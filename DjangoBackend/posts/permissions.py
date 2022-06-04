from rest_framework import permissions
from rest_framework.permissions import BasePermission


class IsOfficial(BasePermission):
    """
    Allows access only to "is_official" users.
    """

    def has_permission(self, request, view):
        return request.user and request.user.is_official


class IsKebeleUser(BasePermission):
    """
    Allows access only to "is_kebele_user" users.
    """

    def has_permission(self, request, view):
        return request.user and request.user.is_kebele_user
