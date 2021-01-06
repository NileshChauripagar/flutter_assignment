import 'package:flutter/material.dart';
import 'package:flutterassignment/screen/store_screen.dart';

import 'common/BlocProviderWidget.dart';

class FlutterAssignmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      home: BlocProviderWidget(),
      routes: {
        StoreScreen.route: (context) => StoreScreen(),
      },
    );
  }
}
