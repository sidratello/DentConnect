import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_card.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/top_background.dart';

class TemplatesPage extends StatelessWidget {
  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        title: Text(
          ' القوالب',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [AppbarVectorBlack()],
      ),
      body: TopBackground(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 24),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (_, __) => SizedBox(
                        height: Static.getheight(
                          context,
                          12,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        return const TemplateCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
