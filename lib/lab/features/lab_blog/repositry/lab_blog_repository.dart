import 'dart:io';
import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/lab_blog/model/creat_blog_model.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class LabBlogRepository {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<CreateBlogModel>>
      createBlogPost({
    required String title,
    required String content,
    required bool isSensitiveRedacted,
    required List<File> documentFiles,
  }) async {
    final response =
        await _apiService.post<Map<String, dynamic>>(
      'lab-blog/create',
      data: {
        'Title': title.trim(),
        'Content': content.trim(),
        'IsSensitiveRedacted':
            isSensitiveRedacted,
      },
      files: documentFiles,
      fileKey: 'DocumentFiles',
    );

    if (response.success &&
        response.data != null) {
      return ApiResponse.success(
        data: CreateBlogModel.fromJson(
          response.data!,
        ),
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }


  Future<ApiResponse<BlogPostModel>>
    updateBlogPost({
  required int postId,
  required String title,
  required String content,
  required bool isSensitiveRedacted,
  required List<File> newDocumentFiles,
}) async {
  final response =
      await _apiService.putWithFiles<
          Map<String, dynamic>>(
    'lab-blog/$postId/update',
    data: {
      'Title': title,
      'Content': content,
      'IsSensitiveRedacted':
          isSensitiveRedacted,
    },
    files: newDocumentFiles,
    fileKey: 'NewDocumentFiles',
  );

  if (!response.success ||
      response.data == null) {
    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }

  try {
    final post = BlogPostModel.fromJson(
      Map<String, dynamic>.from(
        response.data!,
      ),
    );

    return ApiResponse.success(
      data: post,
      message: response.message,
      statusCode: response.statusCode,
    );
  } catch (_) {
    return ApiResponse.error(
      'تعذر قراءة بيانات المنشور المعدل.',
    );
  }
}
}