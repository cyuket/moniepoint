import 'package:flutter/material.dart';
import 'package:test_app/src/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    required this.items,
    super.key,
  });
  final List<CustomBottomNavItem> items;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          widget.items.length,
          (index) => cards(
            icon: widget.items[index].icon,
            isActive: widget.items[index].isActive,
            onTap: widget.items[index].onTap,
          ),
        ),
      ),
    );
  }

  Widget cards({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: isActive ? 60 : 50,
        width: isActive ? 60 : 50,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : Colors.black,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: AppColors.pureWhite,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavItem {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;
  const CustomBottomNavItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });
}
