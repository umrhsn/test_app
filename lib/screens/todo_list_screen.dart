import 'package:flutter/material.dart';
import 'package:test_app/common/widgets/test_widgets.dart';

import '../common/themes.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  static String route = '/todo_list_screen';

  @override
  Widget build(BuildContext context) {
    final _mediaQueryData = MediaQuery.of(context);
    final bool _isLightMode =
        _mediaQueryData.platformBrightness == Brightness.light;
    final bool _isPortrait =
        _mediaQueryData.orientation == Orientation.portrait;
    final Size _size = _mediaQueryData.size;
    Themes.setStatNavBarsStyle(_isLightMode);

    return const Scaffold(
      body: TestWidgets.temporaryTestText,
    );
  }
}
