import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/utils/routs.dart';
import 'package:task_app/utils/theme.dart';
import 'package:task_app/view/home/home_screen.dart';
import 'package:task_app/view_model/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'M360ICT',
        theme: theme(),
        initialRoute: HomeScreen.routeName,
        routes: routes,
      ),
    );
  }
}
