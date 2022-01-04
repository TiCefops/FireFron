

import 'package:cefops/app/data/model/model_publication.dart';
import 'package:cefops/app/data/repository/post/post_repository.dart';

///service de posts
class PostService{
  PostRepository _repository=PostRepository();

  Future<PostModel> getPost()async{

    return _repository.fetchPosts();
  }





}