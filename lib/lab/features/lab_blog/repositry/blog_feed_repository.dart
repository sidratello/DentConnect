import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/lab_blog/model/blog_search_model.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';


class BlogFeedRepository {
  final ApiService _apiService;

  BlogFeedRepository({
    ApiService? apiService,
  }) : _apiService =
            apiService ?? ApiService();

  Future<ApiResponse<List<BlogPostModel>>>
      getDoctorPosts() {
    return _getPosts(
      'lab-blog/doctor-posts',
    );
  }

  Future<ApiResponse<List<BlogPostModel>>>
      getLabPosts() {
    return _getPosts(
      'lab-blog/all-posts',
    );
  }




  Future<ApiResponse<List<BlogPostModel>>>
      _getPosts(
    String path,
  ) async {
    final response =
        await _apiService.get<List<dynamic>>(
      path,
    );

    if (!response.success ||
        response.data == null) {
      return ApiResponse.error(
        response.message,
        statusCode: response.statusCode,
      );
    }

    try {
      final posts = response.data!
          .whereType<Map>()
          .map(
            (item) =>
                BlogPostModel.fromJson(
              Map<String, dynamic>.from(item),
            ),
          )
          .toList();

   

      return ApiResponse.success(
        data: posts,
        message: response.message,
        statusCode: response.statusCode,
      );
    } catch (_) {
      return ApiResponse.error(
        'تعذر قراءة بيانات المنشورات.',
        statusCode: response.statusCode,
      );
    }
  }



  Future<ApiResponse<BlogSearchResponse>>
      searchPosts(
    String query,
  ) async {
    final response =
        await _apiService.post<
            Map<String, dynamic>>(
      'lab-blog/search',
      data: {
        'query': query,
      },
    );

    if (!response.success ||
        response.data == null) {
      return ApiResponse.error(
        response.message,
        statusCode: response.statusCode,
      );
    }

    try {
      final result =
          BlogSearchResponse.fromJson(
        Map<String, dynamic>.from(
          response.data!,
        ),
      );

      return ApiResponse.success(
        data: result,
        message: response.message,
        statusCode: response.statusCode,
      );
    } catch (_) {
      return ApiResponse.error(
        'تعذر قراءة نتائج البحث.',
        statusCode: response.statusCode,
      );
    }
  }
}