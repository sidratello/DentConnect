




import 'dart:io';

import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

Future<ApiResponse<Map<String, dynamic>>> updateLabProfile({
  required String name,
  required String email,
  required String phone,
  required String namePlace,
  required String addressPlace,
  required String cityPlace,
  required String countryPlace,
  required String description,
  required String yearsOfExperience,
  required List<String> specialties,
  required List<String> materials,
  required String availability,
  required bool hasScanVisitService,
}) async {
  final ApiService apiService = ApiService();

  return await apiService.put<Map<String, dynamic>>(
    'lab-profile/me',
    data: {
      'name': name,
      'email': email,
      'phone': phone,
      'namePlace': namePlace,
      'addressPlace': addressPlace,
      'cityPlace': cityPlace,
      'countryPlace': countryPlace,
      'description': description,
      'yearsOfExperience': yearsOfExperience,
      'availability': availability,
      'hasScanVisitService': hasScanVisitService,

  for (int i = 0; i < specialties.length; i++)
    'specialties[$i]': specialties[i],


    if (materials.isEmpty)
    'materials': '[]'
  else
    for (int i = 0; i < materials.length; i++)
      'materials[$i]': materials[i],
    },
  );
}
Future<ApiResponse<Map<String, dynamic>>> addLabPrice({
  required String compensationType,
  required String unitPrice,
  String? notes,

}) async {
  final ApiService apiService = ApiService();

  return await apiService.post<Map<String, dynamic>>(
    'lab-profile/prices',
 data: {
  'CompensationType': compensationType,
  'UnitPrice': unitPrice,

  if (notes != null && notes.isNotEmpty)
    'Notes': notes,
},
  );
}
Future<ApiResponse<List<dynamic>>> getCompensationTypesRepo() async {
  final ApiService apiService = ApiService();

  return await apiService.get<List<dynamic>>(
    'Enums/compensation-type',
  );
}
Future<ApiResponse<String>> updateLabPrice({
  required int priceId,
  required String unitPrice,
}) async {
  final ApiService apiService = ApiService();

  return await apiService.put<String>(
    'lab-profile/prices/$priceId',
    data: {
      'UnitPrice': unitPrice,
    },
  );
}

Future<ApiResponse<String>> deleteLabPrice({
  required int priceId,
}) async {
  final ApiService apiService = ApiService();

  return await apiService.request<String>(
    'lab-profile/prices/$priceId',
    method: 'DELETE',
  );
}


Future<ApiResponse<String>> addGalleryImageRepo({
  required File image,
}) async {
  final ApiService apiService = ApiService();

  return await apiService.post<String>(
    'lab-profile/gallery',
    file: image,
    fileKey: 'Images',
  );
}

Future<ApiResponse<String>> deleteGalleryImageRepo({
  required int imageId,
}) async {
  final ApiService apiService = ApiService();

  return await apiService.request<String>(
    'lab-profile/gallery/$imageId',
    method: 'DELETE',
  );
}