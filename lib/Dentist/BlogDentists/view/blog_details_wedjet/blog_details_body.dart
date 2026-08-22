import 'package:flutter/material.dart';
import 'package:template/Dentist/BlogDentists/view/blog_details_wedjet/blog_details_content.dart';
import 'package:template/Dentist/BlogDentists/view/blog_details_wedjet/blog_details_header.dart';

import 'package:template/lab/features/lab_blog/model/post_model.dart';

class BlogDoctorPostDetailsBody extends StatelessWidget {
  final BlogPostModel post;

  const BlogDoctorPostDetailsBody({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          bottom: 40,
        ),
        child: Column(
          children: [
            const BlogDoctorPostDetailsHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                8,
                18,
                0,
              ),
              child: BlogDoctorPostDetailsContent(
                post: post,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
