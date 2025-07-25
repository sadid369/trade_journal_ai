import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../widgets/custom_navbar/custom_navbar.dart';

class MainScreenWithBottomNav extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreenWithBottomNav({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: navigationShell.currentIndex,
        onTap: (index) => _onTabTapped(context, index),
        selectedIcons: [
          Assets.icons.homefill,
          Assets.icons.journalfill,
          Assets.icons.botfill,
          Assets.icons.settingsfill,
        ],
        unselectedIcons: [
          Assets.icons.home,
          Assets.icons.journal,
          Assets.icons.bot,
          Assets.icons.settings,
        ],
        labels: const [
          'Home',
          'Reports',
          'Chatbot',
          'Settings',
        ],
      ),
    );
  }

  void _onTabTapped(BuildContext context, int index) {
    if (navigationShell.currentIndex != index) {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }
  }
}
