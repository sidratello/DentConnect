import 'package:flutter/material.dart';
import 'package:template/Dentist/BlogDentists/controller/blog_feed_controller.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';

class BlogDoctorFeedEmptyState extends StatelessWidget {
  final bool hasSearchQuery;
  final BlogDoctorFeedTab selectedTab;

  const BlogDoctorFeedEmptyState({
    super.key,
    required this.hasSearchQuery,
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyStateCard(
      showCard: false,
      icon: hasSearchQuery ? Icons.search_off_rounded : Icons.article_outlined,
      title: hasSearchQuery ? 'لا توجد نتائج مطابقة' : 'لا توجد منشورات حالياً',
      subtitle: _getSubtitle(),
    );
  }

  String _getSubtitle() {
    if (hasSearchQuery) {
      return 'جرّب استخدام كلمات بحث مختلفة.';
    }

    switch (selectedTab) {
      case BlogDoctorFeedTab.doctors:
        return 'لا توجد منشورات أطباء متاحة حالياً.';

      case BlogDoctorFeedTab.labs:
        return 'لا توجد منشورات مخابر متاحة حالياً.';
    }
  }
}
