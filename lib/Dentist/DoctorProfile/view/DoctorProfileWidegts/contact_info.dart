import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';

class ContactInfo extends GetView<HomeController> {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF367AFF);

    return Obx(() {
      final profile = controller.doctorProfileModel.value;
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.phone_android_rounded,
                  color: primary,
                ),
                SizedBox(width: 10),
                Text(
                  'معلومات التواصل',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _infoTile(
              context,
              Icons.email_outlined,
              'البريد الإلكتروني',
              profile?.email ?? 'غير متوفر',
              'email',
            ),
            const Divider(height: 28),
            _infoTile(
              context,
              Icons.phone_outlined,
              'رقم الهاتف',
              profile?.phone ?? 'غير متوفر',
              'phone',
            ),
            const Divider(height: 28),
            _infoTile(
              context,
              Icons.location_on_outlined,
              'المدينة',
              profile?.cityPlace ?? 'غير متوفر',
              'cityPlace',
            ),
          ],
        ),
      );
    });
  }

  Widget _infoTile(
    BuildContext context,
    IconData icon,
    String title,
    String value,
    String field,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0x14367AFF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF367AFF),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            _showEditDialog(
              context,
              title: title,
              value: value == 'غير متوفر' ? '' : value,
              field: field,
            );
          },
          icon: const Icon(
            Icons.edit_outlined,
            size: 20,
            color: Color(0xFF367AFF),
          ),
          tooltip: 'تعديل',
        ),
      ],
    );
  }

  void _showEditDialog(
    BuildContext context, {
    required String title,
    required String value,
    required String field,
  }) {
    final textController = TextEditingController(
      text: value,
    );

    Get.dialog(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'تعديل $title',
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: 19,
            ),
          ),
          content: TextField(
            controller: textController,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'أدخل $title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: Get.back,
              child: const Text(
                'إلغاء',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final newValue = textController.text.trim();

                if (newValue.isEmpty) {
                  Get.snackbar(
                    'تنبيه',
                    'يرجى إدخال قيمة صحيحة',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                Get.back();

                await _updateField(
                  field: field,
                  value: newValue,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF367AFF),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'حفظ',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateField({
    required String field,
    required String value,
  }) async {
    switch (field) {
      case 'email':
        await controller.updateDoctorProfile(
          email: value,
        );
        break;

      case 'phone':
        await controller.updateDoctorProfile(
          phone: value,
        );
        break;

      case 'cityPlace':
        await controller.updateDoctorProfile(
          cityPlace: value,
        );
        break;
    }
  }
}
