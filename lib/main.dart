import 'package:pocash_app/other/route.dart';
import 'package:pocash_app/pages/AddExpenditurePage.dart';
import 'package:pocash_app/pages/AddIncomePage.dart';
import 'package:pocash_app/pages/DetailCashFlowPage.dart';
import 'package:pocash_app/pages/HomePage.dart';
import 'package:pocash_app/pages/LoginPage.dart';
import 'package:pocash_app/pages/SettingsPage.dart';
import 'package:pocash_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pocash_app/pages/aboutApp.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

final routes = {
  loginRoute: (BuildContext context) => LoginPage(),
  homeRoute: (BuildContext context) => HomePage(),
  settingsRoute: (BuildContext context) => SettingsPage(),
  addExpenseRoute: (BuildContext context) => AddExpenditurePage(),
  addIncomeRoute: (BuildContext context) => AddIncomePage(),
  detailCashFlowRoute: (BuildContext context) => DetailCashFlowPage(),
  aboutRoute: (BuildContext context) => AboutPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "POCASH App",
      theme: ThemeData(primaryColor: Colors.green.shade800),
      routes: routes,
    );
  }
}
