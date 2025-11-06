import 'package:flutter/material.dart';
import 'package:trazzo_flutter/Screens/home_screen.dart';
import 'package:trazzo_flutter/Screens/iniciar_sesion.dart';
import 'package:trazzo_flutter/Screens/principal_screen.dart';
import 'package:trazzo_flutter/Screens/register_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrincipalScreen(),
    );
  }
}
