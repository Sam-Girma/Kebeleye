from msilib.schema import ServiceInstall
from rest_framework.response import Response
from rest_framework.decorators import api_view
from posts.models import Post
from .serializers import PostSerializer


@api_view(['GET'])
def getpost(request):
    post_fields = Post.objects.all()
    serializer = PostSerializer(post_fields, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def createpost(request):
    serializer = PostSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)


@api_view(['PUT'])
def updatepost(request):
