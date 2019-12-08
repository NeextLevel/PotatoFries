import 'package:android_flutter_settings/android_flutter_settings.dart';
import 'package:flutter/material.dart';
import 'package:potato_fries/internal/page_data.dart';
import 'package:potato_fries/pagelayout/page_layout.dart';
import 'package:potato_fries/provider/base.dart';
import 'package:potato_fries/ui/color_picker_tile.dart';
import 'package:potato_fries/ui/section_header.dart';

class ThemesPageLayout extends PageLayout {
  @override
  int get categoryIndex => 2;

  @override
  List<Widget> body(BuildContext context, {BaseDataProvider provider}) => [
        SectionHeader(title: "Colors"),
        ColorPickerTile(
          title: 'Accent color',
          subtitle: 'Pick your favourite color!',
          onChange: (dark, light, {ctx}) {
            bloc.changeAccent(
              Theme.of(ctx ?? context).brightness == Brightness.dark
                  ? dark
                  : light,
            );
          },
          defaultDark: Colors.black,
          defaultLight: Colors.black,
          lightnessDeltaCenter: 0.15,
          lightnessDeltaEnd: 0.6,
          onApply: (String dark, String light) {
            AndroidFlutterSettings.setProp(
              'persist.sys.theme.accent_dark',
              dark,
            );
            AndroidFlutterSettings.setProp(
              'persist.sys.theme.accent_light',
              light,
            );

            //AndroidFlutterSettings.reloadAssets('com.android.settings');
            //AndroidFlutterSettings.reloadAssets('com.android.systemui');
          },
        ),
      ];
}
