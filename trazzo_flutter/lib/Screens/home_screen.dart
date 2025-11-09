import 'package:flutter/material.dart';
import '../utils/util.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Color verde = const Color(0xFF10C377);
  final Color fondo = const Color(0xFFF1FAF5);
  final Color grisOscuro = const Color(0xFF3E3E3E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LogoTrazzo(alto: 80),
              const SizedBox(height: 16),
              Text(
                'Bienvenido a Trazzo',
                style: TextStyle(
                  color: grisOscuro,
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 24),
              BotonApp(
                texto: 'Iniciar sesión',
                onPressed: () {
                  
                },
                backgroundColor: verde,
                textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              BotonApp(
                texto: 'Crear cuenta',
                onPressed: () {
                  
                },
                backgroundColor: const Color(0xFF14D487),
                textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}