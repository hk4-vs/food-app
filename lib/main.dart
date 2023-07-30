import 'package:flutter/material.dart';
import 'package:food_app/my_themes.dart';
import 'package:provider/provider.dart';

import 'view-model/theme_mode_view_model.dart';
import 'views/get_started_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ThemeModeViewModel>(create: (_) => ThemeModeViewModel()),
        ],
        child: ChangeNotifierProvider<ThemeModeViewModel>(
          create: (context) => ThemeModeViewModel(),
          child: Consumer<ThemeModeViewModel>(
            builder: (context, value, child) {
              return MaterialApp(
                home: const GetStartedView(),
                debugShowCheckedModeBanner: false,
                theme: MyThemes().lightTheme(),
                darkTheme: MyThemes().darkTheme(),
                themeMode: value.themeMode,
              );
            },
          ),
        ));
  }
}
