import 'package:flutter/material.dart';

import 'package:trazzo_flutter/Screens/subir_obra/subir_obra_screen.dart';
import 'package:trazzo_flutter/Screens/trending/trending_screen.dart';

import 'package:trazzo_flutter/Screens/home_screen.dart';
import 'package:trazzo_flutter/Screens/iniciar_sesion.dart';
import 'package:trazzo_flutter/Screens/principal_screen.dart';
import 'package:trazzo_flutter/Screens/register_screen.dart';
import 'package:trazzo_flutter/Screens/publicaciones_guardadas_screen.dart';
import 'package:trazzo_flutter/Screens/crear_editar_comment_screen.dart';

void main() {
  print('Iniciando en PublicacionesGuardadasScreen');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: PrincipalScreen(),
        debugShowCheckedModeBanner: false,
        title: 'Trazzo',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
        ),
      //home: PrincipalScreen(),
      //home: IniciarSesionScreen(),
      //home: RegisterScreen(),
      //home: PublicacionesGuardadasScreen(),
      /*
      home: CrearEditarCommentScreen(
        obraId: "obra_prueba",
      ),
      */
      //home: const SubirObraScreen(),
      home: const TrendingScreen(),

    );
  }
}
