import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/orderconection/model/order_conection_model.dart';



class OrderConnectionRepo {

  final ApiService _apiService = ApiService();

  Future<ApiResponse<List<OrderConnectionModel>>> getRequests() async {

    final response = await _apiService.get<List<dynamic>>(
      'ConnectionForLab/requests',
    );

    if(response.success && response.data != null){

      final List<OrderConnectionModel> items =

      response.data!
          .map((e) => OrderConnectionModel.fromJson(e))
          .toList();

      return ApiResponse.success(
        data: items,
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }

  Future<ApiResponse<dynamic>> acceptRequest(int requestId) async {
  return await _apiService.post<dynamic>(
    'ConnectionForLab/requests/$requestId/accept',
  );
}
}