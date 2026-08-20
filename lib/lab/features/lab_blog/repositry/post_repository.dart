
import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';


class PostRepository {
  final ApiService _apiService;

  PostRepository({
    ApiService? apiService,
  }) : _apiService = apiService ?? ApiService();



Future<ApiResponse<List<BlogPostModel>>>
    getMyPendingPosts() async {
  final response =
      await _apiService.get<List<dynamic>>(
    'lab-blog/my-posts/pending',
  );

  if (!response.success) {
    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }

  try {
    final posts = (response.data ?? [])
        .map(
          (item) => BlogPostModel.fromJson(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList();

    return ApiResponse.success(
      data: posts,
      message: response.message,
      statusCode: response.statusCode,
    );
  } catch (e) {
    return ApiResponse.error(
      'تعذر قراءة بيانات المنشورات.',
    );
  }
}


Future<ApiResponse<List<BlogPostModel>>>
      getMyApprovedPosts() async {
    final response =
        await _apiService.get<List<dynamic>>(
      'lab-blog/my-posts',
    );

    if (!response.success) {
      return ApiResponse.error(
        response.message,
        statusCode: response.statusCode,
      );
    }

    try {
      final posts = (response.data ?? [])
          .map(
            (item) => BlogPostModel.fromJson(
              Map<String, dynamic>.from(item),
            ),
          )
          .toList();

      return ApiResponse.success(
        data: posts,
        message: response.message,
        statusCode: response.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(
        'تعذر قراءة بيانات المنشورات المقبولة.',
      );
    }

      }

Future<ApiResponse<List<BlogPostModel>>>
    getMyRejectedPosts() async {
  final response =
      await _apiService.get<List<dynamic>>(
    'lab-blog/my-posts/rejected',
  );

  if (!response.success) {
    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }

  try {
    final posts = (response.data ?? [])
        .map(
          (item) => BlogPostModel.fromJson(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList();

    return ApiResponse.success(
      data: posts,
      message: response.message,
      statusCode: response.statusCode,
    );
  } catch (e) {
    return ApiResponse.error(
      'تعذر قراءة بيانات المنشورات المرفوضة.',
    );
  }
}

  
Future<ApiResponse<void>> deletePost(
  int postId,
) async {
  final response = await _apiService.delete<dynamic>(
    'lab-blog/$postId',
  );

  if (!response.success) {
    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }

  return ApiResponse.success(
    message: response.message.isNotEmpty
        ? response.message
        : 'تم حذف المنشور بنجاح.',
    statusCode: response.statusCode,
  );
}




}







