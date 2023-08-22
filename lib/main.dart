import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'modules/dashboard/ui/dashboard_screen.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
 // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      theme:
      NeumorphicThemeData(
      //  baseColor: AppColors.secondary.shade50.withOpacity(0.1),
        lightSource: LightSource.topLeft,
        depth: 4,
        intensity: 0.65,
      ),


        home:  MaterialApp(
          title: 'Mypcot Assignment',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const DashboardScreen(),
        ),

    );
  }
}
