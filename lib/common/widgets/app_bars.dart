import 'package:flutter/material.dart';
import 'package:test_app/common/themes.dart';
import 'package:test_app/common/widgets/images.dart';

class AppBars {
  /// AppBar Widgets
  /// [noTitleAppBarSettings] is used to implement an AppBar with no leading icon or title text, but adds a trailing settings icon
  /// [customAppBar] is the AppBar used in this project, but with no trailing icon

  // static PreferredSize zeroHeightAppBar = PreferredSize(
  //   preferredSize: const Size.fromHeight(0),
  //   child: AppBar(
  //     backgroundColor: Colors.transparent,
  //     titleTextStyle: const TextStyle(color: Colors.transparent),
  //     toolbarTextStyle: const TextStyle(color: Colors.transparent),
  //   ),
  // );

  static AppBar noTitleAppBarSettings(bool isLightMode) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, right: 12),
          child: IconButton(
              icon: Icon(
                Icons.settings,
                color: isLightMode
                    ? Themes.primaryColorDark
                    : Themes.primaryColorLight,
              ),
              onPressed: null),
        )
      ],
    );
  }

  static AppBar customAppBar = AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
      child: Image.asset(Images.logoAssetImagePath),
    ),
    title: const Text('TEST APP'),
  );
}
