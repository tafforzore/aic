import 'package:finalaic/presentation/components/app_colors.dart';
import 'package:finalaic/presentation/components/app_size.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String backgroundImageUrl;
  final List<Widget> actions;
  final double expandedHeight;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.backgroundImageUrl,
    this.actions = const [],
    this.expandedHeight = 200.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: TextStyle(
            color: AppColor.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.titleSize,
          ),
        ),
        background: Image.network(
          backgroundImageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColor.primaryColor,
                    AppColor.secondaryColor,
                  ],
                ),
              ),
            );
          },
        ),
      ),
      actions: actions,
      leading: Icon(
        Icons.arrow_back,
        color: AppColor.whiteColor,
      ),
      elevation: 6,
    );
  }
}
