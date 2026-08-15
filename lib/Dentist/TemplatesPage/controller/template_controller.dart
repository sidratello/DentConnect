import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:template/Dentist/TemplatesPage/model/template_data.dart';
import 'package:template/Dentist/TemplatesPage/model/template_model.dart';

class TemplateController extends GetxController {
  final storage = GetStorage();

  static const String deletedKey = 'deletedTemplates';
  static const String customKey = 'customTemplates';

  final RxList<CaseTemplate> templates = TemplateData.templates.obs;

  @override
  void onInit() {
    super.onInit();

    final deletedIds = List<int>.from(
      storage.read(deletedKey) ?? [],
    );

    templates.assignAll(
      TemplateData.templates.where(
        (e) => !deletedIds.contains(e.id),
      ),
    );

    final customTemplates = storage.read(customKey);

    if (customTemplates != null) {
      templates.addAll(
        (customTemplates as List).map((e) => CaseTemplate.fromJson(e)).toList(),
      );
    }
  }

  void deleteTemplate(int id) {
    templates.removeWhere((e) => e.id == id);

    if (id <= 6) {
      final deleted = List<int>.from(storage.read(deletedKey) ?? []);

      if (!deleted.contains(id)) {
        deleted.add(id);
      }

      storage.write(deletedKey, deleted);
    } else {
      final customTemplates =
          templates.where((e) => e.id > 6).map((e) => e.toJson()).toList();

      storage.write(customKey, customTemplates);
    }
  }

  void addTemplate(CaseTemplate template) {
    final newTemplate = template.copyWith(
      id: DateTime.now().millisecondsSinceEpoch,
    );

    templates.add(newTemplate);

    final customTemplates =
        templates.where((e) => e.id > 6).map((e) => e.toJson()).toList();

    storage.write(customKey, customTemplates);
  }
}
