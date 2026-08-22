import 'package:template/Dentist/BlogDentists/model/search_doctor_blog.dart';
import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class BlogFeedDoctorRepository {
  final ApiService _apiService;

  BlogFeedDoctorRepository({
    ApiService? apiService,
  }) : _apiService = apiService ?? ApiService();

  Future<ApiResponse<List<BlogPostModel>>> getDoctorPosts() {
    return _getPosts(
      'DoctorBlog/approved-doctor-posts',
    );
  }

  Future<ApiResponse<List<BlogPostModel>>> getLabPosts() {
    return _getPosts(
      'lab-blog/all-posts',
    );
  }

  Future<ApiResponse<List<BlogPostModel>>> _getPosts(
    String path,
  ) async {
    final response = await _apiService.get<dynamic>(
      path,
    );

    if (!response.success) {
      return ApiResponse.error(
        response.message,
        statusCode: response.statusCode,
      );
    }

    try {
      final data = response.data;

      // =========================================
      // يوجد منشورات
      // Backend يرجع List
      // =========================================
      if (data is List) {
        final posts = data
            .whereType<Map>()
            .map(
              (item) => BlogPostModel.fromJson(
                Map<String, dynamic>.from(
                  item,
                ),
              ),
            )
            .toList();

        return ApiResponse.success(
          data: posts,
          message: response.message,
          statusCode: response.statusCode,
        );
      }

      // =========================================
      // لا توجد منشورات
      // Backend يرجع Map مثل:
      //
      // {
      //   "message":
      //       "لا توجد منشورات مقبولة للأطباء حالياً."
      // }
      // =========================================
      if (data is Map) {
        final message = data['message']?.toString() ?? response.message;

        return ApiResponse.success(
          data: <BlogPostModel>[],
          message: message,
          statusCode: response.statusCode,
        );
      }

      // =========================================
      // null أو response غير متوقع
      // نعتبر القائمة فارغة
      // =========================================
      return ApiResponse.success(
        data: <BlogPostModel>[],
        message: response.message,
        statusCode: response.statusCode,
      );
    } catch (error) {
      return ApiResponse.error(
        'تعذر قراءة بيانات المنشورات.',
        statusCode: response.statusCode,
      );
    }
  }

  Future<ApiResponse<DoctorBlogSearchResponse>> searchPosts(
    String query,
  ) async {
    final response = await _apiService.post<dynamic>(
      'Search/blog',
      data: {
        'query': query.trim(),
      },
    );

    // لا توجد نتائج بحث
    if (response.statusCode == 404) {
      return ApiResponse.success(
        data: DoctorBlogSearchResponse.empty(),
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    if (!response.success || response.data == null) {
      return ApiResponse.error(
        response.message,
        statusCode: response.statusCode,
      );
    }

    try {
      final data = response.data;

      if (data is! Map) {
        return ApiResponse.error(
          'تعذر قراءة نتائج البحث.',
          statusCode: response.statusCode,
        );
      }

      final result = DoctorBlogSearchResponse.fromJson(
        Map<String, dynamic>.from(
          data,
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
