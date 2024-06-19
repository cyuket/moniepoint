import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/src/assets.dart';
import 'package:test_app/src/colors.dart';
import 'package:test_app/src/utils/ui_helper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late AnimationController animation;

  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    final uiHelper = UiHelper(context);
    return Container(
      height: uiHelper.screenSize.height,
      width: uiHelper.screenSize.width,
      color: AppColors.black,
      child: Stack(
        children: [
          Image.asset(
            Assets.map,
            fit: BoxFit.fitHeight,
            height: uiHelper.screenSize.height,
            width: uiHelper.screenSize.width,
          ),
          SizedBox(
            height: uiHelper.screenSize.height,
            width: uiHelper.screenSize.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  0,
                  20,
                  140,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeTransition(
                      opacity: _fadeInFadeOut,
                      child: Row(
                        children: [
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 0,
                                  ),
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 10,
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeInFadeOut,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: AppColors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Align(
                                    child: Icon(
                                      Icons.more_vert,
                                      color: AppColors.backgroundWhite,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(10),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: AppColors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Align(
                                    child: Icon(
                                      Icons.my_location,
                                      color: AppColors.backgroundWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          FadeTransition(
                            opacity: _fadeInFadeOut,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Align(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.list_sharp,
                                        color: AppColors.backgroundWhite,
                                      ),
                                      const Gap(8),
                                      Text(
                                        'List of variants',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.backgroundWhite,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
