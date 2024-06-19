import 'package:flutter/material.dart';
import 'package:test_app/screens/pages/search_page.dart';
import 'package:test_app/screens/widgets/bottom_nav_bar.dart';

import 'home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  late AnimationController animation;

  late Animation<Offset> _slideUp;

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

  final _widgets = [
    const SearchPage(),
    Container(),
    const HomePage(),
    Container(),
    Container(),
  ];

  final activeIndex = ValueNotifier(2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: activeIndex,
        builder: (context, index, _) {
          return Stack(
            children: [
              _widgets[index],
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SlideTransition(
                    position: _slideUp,
                    child: BottomNavBar(
                      items: [
                        CustomBottomNavItem(
                          icon: Icons.search,
                          isActive: index == 0,
                          onTap: () {
                            activeIndex.value = 0;
                          },
                        ),
                        CustomBottomNavItem(
                          icon: Icons.messenger,
                          isActive: index == 1,
                          onTap: () {
                            activeIndex.value = 1;
                          },
                        ),
                        CustomBottomNavItem(
                          icon: Icons.home_filled,
                          isActive: index == 2,
                          onTap: () {
                            activeIndex.value = 2;
                          },
                        ),
                        CustomBottomNavItem(
                          icon: Icons.favorite_outlined,
                          isActive: index == 3,
                          onTap: () {
                            activeIndex.value = 3;
                          },
                        ),
                        CustomBottomNavItem(
                          icon: Icons.person,
                          isActive: index == 4,
                          onTap: () {
                            activeIndex.value = 4;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
