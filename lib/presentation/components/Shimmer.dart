import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [0.3, 0.5, 0.7],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

class ShimmerEffect extends StatefulWidget {
  final Widget child;

  const ShimmerEffect({Key? key, required this.child}) : super(key: key);

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return _shimmerGradient.createShader(
              Rect.fromLTWH(
                -bounds.width + (bounds.width * 2 * _controller.value),
                0,
                bounds.width,
                bounds.height,
              ),
            );
          },
          child: widget.child,
        );
      },
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;
  final double borderRadius;

  const ShimmerBox({
    Key? key,
    required this.width,
    required this.height,
    this.shape = BoxShape.rectangle,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius)
              : null,
        ),
      ),
    );
  }
}



class ShimmerTile extends StatelessWidget {
  ShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Espacement supérieur
          SizedBox(height: 4.h),

          // Texte de bienvenue
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ShimmerEffect(
              child: ShimmerBox(
                width: 70.w, // Largeur du texte de bienvenue
                height: 5.h, // Hauteur du texte de bienvenue
                borderRadius: 12.sp, // Arrondi pour un effet fluide
              ),
            ),
          ),

          SizedBox(height: 3.h),

          // Barre de recherche
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ShimmerEffect(
              child: ShimmerBox(
                width: 90.w,
                height: 6.h,
                borderRadius: 25.sp,
              ),
            ),
          ),

          SizedBox(height: 4.h),

          // Section des icônes principales (grille)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: GridView.builder(
              itemCount: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 2.h,
                crossAxisSpacing: 5.w,
              ),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShimmerEffect(
                      child: ShimmerBox(
                        width: 12.w,
                        height: 12.w,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    ShimmerEffect(
                      child: ShimmerBox(
                        width: 15.w,
                        height: 2.h,
                        borderRadius: 5.sp,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: 4.h),

          // Titre section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ShimmerEffect(
              child: ShimmerBox(
                width: 40.w,
                height: 3.h,
                borderRadius: 10.sp,
              ),
            ),
          ),

          SizedBox(height: 3.h),

          // Liste des cartes récentes
          ...List.generate(
            4,
                (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  children: [
                    // Icône circulaire
                    ShimmerEffect(
                      child: ShimmerBox(
                        width: 12.w,
                        height: 12.w,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),

                    // Texte des détails
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerEffect(
                          child: ShimmerBox(
                            width: 60.w,
                            height: 2.5.h,
                            borderRadius: 8.sp,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        ShimmerEffect(
                          child: ShimmerBox(
                            width: 40.w,
                            height: 2.h,
                            borderRadius: 8.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 3.h),
        ],
      ),
    );
  }
}


class ShimmerEtablissement extends StatelessWidget {
  const ShimmerEtablissement({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.sp),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Row(
                  children: [
                    // Circular shimmer for logo/avatar
                    const ShimmerBox(
                      width: 60,
                      height: 60,
                      shape: BoxShape.circle,
                    ),
                    SizedBox(width: 16.sp),
                    // Shimmer blocks for text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ShimmerBox(
                            width: double.infinity,
                            height: 16,
                            borderRadius: 8,
                          ),
                          SizedBox(height: 8),
                          ShimmerBox(
                            width: 120,
                            height: 12,
                            borderRadius: 8,
                          ),
                          SizedBox(height: 8),
                          ShimmerBox(
                            width: 180,
                            height: 12,
                            borderRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.sp),
                    // Small shimmer for arrow icon placeholder
                    const ShimmerBox(
                      width: 20,
                      height: 20,
                      borderRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: 8, // Number of shimmer items to display
      ),
    );
  }
}

