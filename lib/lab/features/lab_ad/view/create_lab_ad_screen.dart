import 'package:flutter/material.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

import 'widgets_creat_ad/create_lab_ad_actions.dart';
import 'widgets_creat_ad/create_lab_ad_body.dart';

class CreateLabAdScreen
    extends StatelessWidget {
  const CreateLabAdScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: Column(
        children: [
          Expanded(
            child: CreateLabAdBody(),
          ),
          CreateLabAdActions(),
        ],
      ),
    );
  }
}