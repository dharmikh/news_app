import 'package:flutter/material.dart';
import 'package:news_app/Screen/view/HomePage.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'Screen/Provider/HomeProvider.dart';
import 'Screen/view/HomePage2.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, ori, type) {
        return ChangeNotifierProvider(
          create: (context) => HomeProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              'Home': (context) => HomePage2(),
            },
          ),
        );
      },
    ),
  );
}
