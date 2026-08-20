import 'package:flutter/material.dart';

import 'package:template/lab/features/lab_blog/model/post_model.dart';
import 'package:template/lab/features/lab_blog/view/blog_details_wedjet/blog_details_content.dart';
import 'package:template/lab/features/lab_blog/view/blog_details_wedjet/blog_details_header.dart';

class BlogPostDetailsBody extends StatelessWidget {
  final BlogPostModel post;

  const BlogPostDetailsBody({
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
            const BlogPostDetailsHeader(),

            Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                8,
                18,
                0,
              ),
              child: BlogPostDetailsContent(
                post: post,
              ),
            ),
          ],
        ),
      ),
    );
  }
}