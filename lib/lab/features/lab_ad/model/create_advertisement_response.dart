import 'advertisement_model.dart';

class CreateAdvertisementResponse {
  final String message;
  final AdvertisementModel advertisement;

  const CreateAdvertisementResponse({
    required this.message,
    required this.advertisement,
  });

  factory CreateAdvertisementResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final advertisementData =
        json['advertisement'];

    if (advertisementData is! Map) {
      throw const FormatException(
        'Advertisement data is missing.',
      );
    }

    return CreateAdvertisementResponse(
      message:
          json['message']?.toString() ??
              '',
      advertisement:
          AdvertisementModel.fromJson(
        Map<String, dynamic>.from(
          advertisementData,
        ),
      ),
    );
  }
}