import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trazzo_flutter/Screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:trazzo_flutter/Screens/sign_in/bloc/sign_in_event.dart';
import 'package:trazzo_flutter/Screens/sign_in/bloc/sign_in_state.dart';
import '../../utils/util.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key});

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {

  final Color fondo = const Color(0xFFF1FAF5);
  final Color verde = const Color(0xFF10C377);
  final Color grisOscuro = const Color(0xFF3E3E3E);
  final Color grisMedio = const Color(0xFF7A7A7A);

  final correoCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  void dispose() {
    correoCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInBloc(),

      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: fondo,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Center(child: LogoTrazzo(alto: 70)),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Inicia sesión',
                        style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w800, color: grisOscuro,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
          
                    TituloSeccion(
                      'Datos de acceso',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, color: grisOscuro, fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
          
                    CampoIconoEtiqueta(
                      icono: Icons.mail_outline,
                      etiqueta: 'Correo electrónico',
                      hint: 'tu@email.com',
                      controller: correoCtrl,
                      labelStyle: TextStyle(color: grisOscuro, fontWeight: FontWeight.w600),
                      iconColor: grisOscuro,
                      inputDecoration: InputDecoration(
                        hintText: 'tu@email.com',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
                      ),
                      onChanged: (value) {
                        context.read<SignInBloc>().add(EmailChanged(value));
                      },
                    ),
                    const SizedBox(height: 8),
          
                    CampoIconoEtiqueta(
                      icono: Icons.lock_outline,
                      etiqueta: 'Contraseña',
                      hint: 'Tu contraseña',
                      controller: passCtrl,
                      esPassword: true,
                      labelStyle: TextStyle(color: grisOscuro, fontWeight: FontWeight.w600),
                      iconColor: grisOscuro,
                      inputDecoration: InputDecoration(
                        hintText: 'Tu contraseña',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
                      ),
                      onChanged: (value) {
                        context.read<SignInBloc>().add(PasswordChanged(value));
                      },
                    ),
          
                    const SizedBox(height: 16),
                    BotonApp(
                      texto: 'Entrar',
                      onPressed: () {
                        if (state.isValid){
                          context.push('/main');
                        }
                      },
                      backgroundColor: state.isValid ? verde : verde.withOpacity(0.5),
                      textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DivisorConTexto(
                      texto: 'o',
                      color: Colors.grey[400],
                      textStyle: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 10),
                    BotonGoogle(
                      onPressed: () {
                        
                      },
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(
                        color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600,
                      ),
                      borderRadius: 12,
                    ),
          
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        '¿No tienes cuenta? Crea una nueva',
                        style: TextStyle(color: grisMedio),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}