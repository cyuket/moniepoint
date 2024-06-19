import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/screens/widgets/profile_widget.dart';
import 'package:test_app/src/colors.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> with TickerProviderStateMixin {
  FlexibleSpaceBarSettings? flexibleSpaceBarSettings;
  late AnimationController animation;
  late Animation<Offset> _slideLeft;
  late Animation<Offset> _slideUp;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideLeft = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(animation);
    _slideUp = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(animation);
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      stretch: true,
      pinned: true,
      scrolledUnderElevation: 1,
      expandedHeight: 400,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final newFlexibleSpaceBarSettings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
        if (newFlexibleSpaceBarSettings.currentExtent != flexibleSpaceBarSettings?.currentExtent) {
          flexibleSpaceBarSettings = newFlexibleSpaceBarSettings;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {});
          });
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SlideTransition(
                    position: _slideLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.pureWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: AppColors.textGrey,
                          ),
                          const Gap(8),
                          Text(
                            'Saint Peterburg',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const ProfileWidget(),
                ],
              ),
              const Gap(30),
              SlideTransition(
                position: _slideUp,
                child: Text(
                  'Hi, Marina',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                    fontSize: 18,
                  ),
                ),
              ),
              const Gap(10),
              SlideTransition(
                position: _slideUp,
                child: Text(
                  "Let's select your\nperfect place",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 27,
                  ),
                ),
              ),
              const Gap(30),
              FadeTransition(
                opacity: _fadeInFadeOut,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: containerContent(
                          textColor: AppColors.pureWhite,
                          startText: 'BUY',
                          midText: 1034,
                          endText: 'offers',
                        ),
                      ),
                    ),
                    const Gap(15),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: containerContent(
                          textColor: AppColors.textGrey,
                          startText: 'RENT',
                          midText: 2212,
                          endText: 'offers',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget containerContent({
    required Color textColor,
    required String startText,
    required double midText,
    required String endText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        children: [
          const Gap(15),
          Text(
            startText,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: textColor,
            ),
          ),
          const Gap(25),
          Countup(
            begin: 0,
            end: midText,
            duration: const Duration(seconds: 2),
            separator: ',',
            style: GoogleFonts.montserrat(
              fontSize: 30,
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(10),
          Text(
            endText,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: textColor,
            ),
          ),
          const Gap(25),
        ],
      ),
    );
  }
}
