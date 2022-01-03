


import 'package:cefops/src/model/model_publication.dart';
import 'package:cefops/src/repository/post/post_repository.dart';

///service de posts
class PostService{
  PostRepository _repository=PostRepository();

  Future<PostModel> getPost()async{

    return _repository.fetchPosts();
  }





}