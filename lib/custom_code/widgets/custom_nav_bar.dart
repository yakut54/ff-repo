// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:womens_council/index.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final Color backgroundColor = Colors.white;
  final Color selectedItemColor = const Color(0xFF312d34);
  final Color unselectedItemColor =
      const Color(0xFF312D34).withOpacity(.5); //0xFF312D34

  /// Список страниц
  late List<Widget> pages;
  final hiddenPage = const CategoriesPageWidget();
  // Список табов с базовыми параметрами
  late final List<_CustomNavigationBarItemData> navigationBarItemData;
  final hiddenNavigationBarItemData = const _CustomNavigationBarItemData(
    icon: FFIcons.klikeIt,
    label: 'Тебе понравится',
  );

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    navigationBarItemData = [
      const _CustomNavigationBarItemData(
        icon: FFIcons.kfeed,
        label: 'Лента',
      ),
      //const _CustomNavigationBarItemData(
      //  icon: FFIcons.klikeIt,
      //  label: 'Тебе понравится',
      //),
      const _CustomNavigationBarItemData(
        icon: FFIcons.kprofile,
        label: 'Профиль',
      ),
    ];
    pages = [
      const NewsFeedPageWidget(),
      // const CategoriesPageWidget(),
      const ProfilePageWidget(),
    ];

    if (isFriendlyCountry(FFAppState().countryCode) || isWeb) {
      pages.insert(1, hiddenPage);
      navigationBarItemData.insert(1, hiddenNavigationBarItemData);
    }
    if (pages.length < navigationBarItemData.length) {
      throw Exception('Количество страниц меньше количества табов');
    }
  }

  @override
  void didUpdateWidget(covariant CustomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (isFriendlyCountry(FFAppState().countryCode) || isWeb) {
      if (!_containsTab()) {
        setState(() {
          pages.insert(1, hiddenPage);
          navigationBarItemData.insert(1, hiddenNavigationBarItemData);
        });
      }
    } else {
      if (_containsTab()) {
        setState(() {
          pages.removeAt(1);
          navigationBarItemData.removeAt(1);
          currentIndex = 0;
        });
      }
    }
  }

  bool _containsTab() =>
      pages.contains(hiddenPage) &&
      navigationBarItemData.contains(hiddenNavigationBarItemData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent),
            child: BottomNavigationBar(
                backgroundColor: backgroundColor,
                selectedItemColor: selectedItemColor,
                unselectedItemColor: unselectedItemColor,
                currentIndex: currentIndex,
                showSelectedLabels: true,
                selectedLabelStyle:
                    FlutterFlowTheme.of(context).titleSmall.override(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Akrobat',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                showUnselectedLabels: true,
                unselectedLabelStyle:
                    FlutterFlowTheme.of(context).titleSmall.override(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Akrobat',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                onTap: onTap,
                items: navigationBarItemData
                    .map((data) => BottomNavigationBarItem(
                          label: data.label,
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 6, top: 6),
                            child: Icon(
                              data.icon,
                              size: 24,
                            ),
                          ),
                        ))
                    .toList())));
  }

  void onTap(int i) => setState(() => currentIndex = i);
}

class _CustomNavigationBarItemData {
  final IconData icon;
  final String label;

  const _CustomNavigationBarItemData({
    required this.icon,
    required this.label,
  });
}
