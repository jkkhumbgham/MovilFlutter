import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:trazzo_flutter/Screens/subir_obra/subir_obra_screen.dart';
import 'package:trazzo_flutter/Screens/trending/trending_screen.dart';

import 'package:trazzo_flutter/Screens/home_screen.dart';
import 'package:trazzo_flutter/Screens/sign_in/iniciar_sesion.dart';
import 'package:trazzo_flutter/Screens/principal_screen.dart';
import 'package:trazzo_flutter/Screens/register_screen.dart';
import 'package:trazzo_flutter/Screens/publicaciones_guardadas_screen.dart';
import 'package:trazzo_flutter/Screens/crear_editar_comment_screen.dart';

final GoRouter _router = GoRouter( routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen(), ),
    GoRoute(path: '/login', builder: (context, state) => IniciarSesion(), ),
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen(), ),
    GoRoute(path: '/main', builder: (context, state) => PrincipalScreen(), ),
    GoRoute(path: '/saved_posts', builder: (context, state) => PublicacionesGuardadasScreen(), ),
    GoRoute(path: '/upload_art', builder: (context, state) => const SubirObraScreen(), ),
    GoRoute(path: '/trending', builder: (context, state) => const TrendingScreen(), ),
    GoRoute(path: '/comment/:obraId', builder: (context, state) {
      final obraId = state.pathParameters['obraId']!;
      return CrearEditarCommentScreen(obraId: obraId);
    }, ),
]);


void main() {
  print('Iniciando en PublicacionesGuardadasScreen');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}