import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

class LabComplaintsRepository {
  final ApiService _apiService =
      ApiService();

  Future<ApiResponse<List<dynamic>>>
      getComplaints() async {
    return await _apiService.get<
        List<dynamic>>(
      'lab/complaints',
    );
  }

  Future<ApiResponse<
          Map<String, dynamic>>>
      getDentistDetails(
    int dentistId,
  ) async {
    return await _apiService.get<
        Map<String, dynamic>>(
      'lab/dentists/$dentistId',
    );
  }



  Future<ApiResponse<
          Map<String, dynamic>>>
      replyToComplaint({
    required int complaintId,
    required String reply,
  }) async {
    return await _apiService.post<
        Map<String, dynamic>>(
      'lab/complaints/$complaintId/reply',
      data: {
        'Reply': reply,
      },
    );
  }
}