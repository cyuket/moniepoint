import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/screens/widgets/profile_header.dart';
import 'package:test_app/screens/widgets/slide_to_act.dart';
import 'package:test_app/screens/widgets/slider_button.dart';
import 'package:test_app/src/assets.dart';
import 'package:test_app/src/colors.dart';
import 'package:test_app/src/utils/ui_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<Offset> _slideUp;

  final GlobalKey house1SlideActionStateKey = GlobalKey();
  final GlobalKey house2SlideActionStateKey = GlobalKey();
  final GlobalKey house3SlideActionStateKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideUp = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(animation);

    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          width: UiHelper(context).screenSize.width,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.backgroundLinear,
            ),
          ),
          child: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                const ProfileHeader(),
                SliverToBoxAdapter(
                  child: SlideTransition(
                    position: _slideUp,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.pureWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.asset(Assets.house1),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: SlideAction(
                                    key: house1SlideActionStateKey,
                                    onSubmit: () {},
                                    elevation: 0,
                                    borderRadius: 30,
                                    innerColor: Colors.transparent,
                                    outerColor: Colors.white,
                                    height: 58,
                                    animationDuration: Duration(seconds: 3),
                                    sliderButtonIcon: const SliderButtonIcon(),
                                    submittedIcon: const SizedBox.shrink(),
                                    sliderRotate: false,
                                    child: Text(
                                      'Gladkova St..26',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomCenter,
                                    children: [
                                      Image.asset(Assets.house2),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        child: SlideAction(
                                          key: house2SlideActionStateKey,
                                          onSubmit: () {},
                                          elevation: 0,
                                          borderRadius: 30,
                                          innerColor: Colors.transparent,
                                          outerColor: Colors.white,
                                          height: 58,
                                          sliderButtonIcon: const SliderButtonIcon(),
                                          submittedIcon: const SizedBox.shrink(),
                                          sliderRotate: false,
                                          child: Text(
                                            'Gladkova St..26',
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomCenter,
                                    children: [
                                      Image.asset(Assets.house3),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        child: SlideAction(
                                          key: house3SlideActionStateKey,
                                          onSubmit: () {},
                                          elevation: 0,
                                          borderRadius: 30,
                                          innerColor: Colors.transparent,
                                          outerColor: Colors.white,
                                          height: 58,
                                          sliderButtonIcon: const SliderButtonIcon(),
                                          submittedIcon: const SizedBox.shrink(),
                                          sliderRotate: false,
                                          child: Text(
                                            'Gladkova St..26',
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
