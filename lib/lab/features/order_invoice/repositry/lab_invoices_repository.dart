import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

class LabInvoicesRepository {
  final ApiService _apiService =
      ApiService();

  Future<
      ApiResponse<
          Map<String, dynamic>>> getInvoices() async {
    return await _apiService.get<
        Map<String, dynamic>>(
      'lab/invoices/paid',
    );
  }
}