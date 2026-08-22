import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class PostDoctorRepository {
  final ApiService _apiService;

  PostDoctorRepository({
    ApiService? apiService,
  }) : _apiService =
            apiService ?? ApiService();

  Future<ApiResponse<List<BlogPostModel>>>
      getMyPendingPosts() async {
    final response =
        await _apiService.get<dynamic>(
      'DoctorBlog/my-pending-posts',
    );

    if (!response.success) {
      return ApiResponse.error(
        response.message,
        statusCode:
            response.statusCode,
      );
    }

    return _parsePostsResponse(
      response.data,
      response.message,
      response.statusCode,
    );
  }

  Future<ApiResponse<List<BlogPostModel>>>
      getMyApprovedPosts() async {
    final response =
        await _apiService.get<dynamic>(
      'DoctorBlog/approved-doctor-posts',
    );

    if (!response.success) {
      return ApiResponse.error(
        response.message,
        statusCode:
            response.statusCode,
      );
    }

    return _parsePostsResponse(
      response.data,
      response.message,
      response.statusCode,
    );
  }

  Future<ApiResponse<List<BlogPostModel>>>
      getMyRejectedPosts() async {
    final response =
        await _apiService.get<dynamic>(
      'DoctorBlog/my-rejected-posts',
    );

    if (!response.success) {
      return ApiResponse.error(
        response.message,
        statusCode:
            response.statusCode,
      );
    }

    return _parsePostsResponse(
      response.data,
      response.message,
      response.statusCode,
    );
  }

  ApiResponse<List<BlogPostModel>>
      _parsePostsResponse(
    dynamic data,
    String message,
    int? statusCode,
  ) {
    try {
      // يوجد منشورات
      if (data is List) {
        final posts = data
            .map(
              (item) =>
                  BlogPostModel.fromJson(
                Map<String, dynamic>.from(
                  item,
                ),
              ),
            )
            .toList();

        return ApiResponse.success(
          data: posts,
          message: message,
          statusCode: statusCode,
        );
      }

      // لا توجد منشورات
      if (data is Map) {
        final backendMessage =
            data['message']
                    ?.toString() ??
                message;

        return ApiResponse.success(
          data:
              <BlogPostModel>[],
          message:
              backendMessage,
          statusCode:
              statusCode,
        );
      }

      return ApiResponse.success(
        data:
            <BlogPostModel>[],
        message:
            message,
        statusCode:
            statusCode,
      );
    } catch (_) {
      return ApiResponse.error(
        'تعذر قراءة بيانات المنشورات.',
        statusCode:
            statusCode,
      );
    }
  }

  Future<ApiResponse<void>>
      deletePost(
    int postId,
  ) async {
    final response =
        await _apiService.delete<dynamic>(
      'DoctorBlog/delete-doctor-post/$postId',
    );

    if (!response.success) {
      return ApiResponse.error(
        response.message,
        statusCode:
            response.statusCode,
      );
    }

    return ApiResponse.success(
      message:
          response.message.isNotEmpty
              ? response.message
              : 'تم حذف المنشور بنجاح.',
      statusCode:
          response.statusCode,
    );
  }
}