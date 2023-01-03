import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx_learn/travel/view/travel_tab_view.dart';
import 'package:mobx_learn/travel/view/travel_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
        ),
      ),
      title: 'Travel App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Travel App Bar'),
        ),
        body: const TravelTabView(),
      ),
    );
  }
}
