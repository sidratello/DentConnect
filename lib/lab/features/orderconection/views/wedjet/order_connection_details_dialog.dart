import 'package:flutter/material.dart';


import 'package:template/lab/features/orderconection/model/order_conection_model.dart';
import 'package:template/lab/features/orderconection/views/wedjet/doctor_details_dialog.dart';

void showOrderConnectionDetailsDialog(
  BuildContext context,
  OrderConnectionModel item,
  VoidCallback onAccept,
  VoidCallback onReject,
) {
  showDoctorDetailsDialog(
    context: context,
    doctorName: item.dentist.name,
    clinicName: item.dentist.namePlace,
     profilePictureUrl: item.dentist.profilePictureUrl,
    address:
        '${item.dentist.countryPlace} - ${item.dentist.cityPlace} - ${item.dentist.addressPlace}',
    phone: item.dentist.phone,
    description:
        'يرغب بالاتصال معك من أجل إرسال الطلبات ومتابعتها.',
    primaryAction: DoctorDialogAction(
      title: 'قبول',
      backgroundColor: const Color(0xff0A2F8F),
      onTap: onAccept,
    ),
    secondaryAction: DoctorDialogAction(
      title: 'رفض',
      backgroundColor: const Color(0xFFF3F5FA),
      textColor: const Color(0xFF6B7280),
      onTap: onReject,
    ),
  );
}