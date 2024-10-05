import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerv1/models/cart.dart';
import 'package:sneakerv1/theme/theme_provider.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(),
      ),
    ],
    child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
      ),
    );
  }
}