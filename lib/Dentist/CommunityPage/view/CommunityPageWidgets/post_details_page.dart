import 'package:flutter/material.dart';
import 'package:template/Dentist/CommunityPage/model/community_post_model.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';
import '../../../../core/utils/static.dart';

class PostDetailsPage extends StatelessWidget {
  final CommunityPostModel post;

  const PostDetailsPage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 250, 255, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'تفاصيل المنشور',
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
          child: SingleChildScrollView(
            padding: EdgeInsets.all(
              Static.getwidth(context, 24),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color.fromRGBO(228, 233, 243, 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      Static.getwidth(context, 16),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: Static.getwidth(context, 22),
                          backgroundImage: AssetImage(
                            post.doctorImage,
                          ),
                        ),
                        AppSpacing.width(context, 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.doctorName,
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans Arabic',
                                  fontWeight: FontWeight.w600,
                                  fontSize: Static.getwidth(context, 16),
                                ),
                              ),
                              Text(
                                post.createdAt,
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans Arabic',
                                  fontWeight: FontWeight.w400,
                                  fontSize: Static.getwidth(context, 12),
                                  color: const Color.fromRGBO(120, 120, 120, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (post.images.isNotEmpty)
                    SizedBox(
                      height: Static.getheight(context, 280),
                      child: PageView.builder(
                        itemCount: post.images.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return Image.asset(
                            post.images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.all(
                      Static.getwidth(context, 18),
                    ),
                    child: Text(
                      post.content,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w400,
                        fontSize: Static.getwidth(context, 15),
                        height: 24 / 15,
                      ),
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
