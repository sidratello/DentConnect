/// lab_profile_screen.dart

import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_action.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_body.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_header.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [

            /// topbar
            const LabProfileTopBar(),

            /// body
            const Expanded(
              child: LabProfileBody(),
            ),

            /// bottom button
            const LabProfileBottom(),
          ],
        ),
      ),
    );
  }
}