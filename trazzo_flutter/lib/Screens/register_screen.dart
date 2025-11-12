import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/util.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  final Color fondo = const Color(0xFFF1FAF5);
  final Color verde = const Color(0xFF10C377);
  final Color grisOscuro = const Color(0xFF3E3E3E);
  final Color grisMedio = const Color(0xFF7A7A7A);
  final Color chipBg = const Color(0xFFD8F4E7);

  
  final correoCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final usuarioCtrl = TextEditingController();
  final edadCtrl = TextEditingController(text: '18');
  final profesionCtrl = TextEditingController();
  final bioCtrl = TextEditingController();

  
  final intereses = <String>[
    'Pintura', 'Dibujo', 'Fotografía', 'Diseño Digital',
    'Origami', 'Escultura', 'Street Art', 'Moda',
    'Ilustración', 'Concept Art', 'Arte Tradicional',
    'Collage', 'Acuarela', 'Óleo', 'Acrílico',
  ];
  final seleccionados = <String>{};

  

  @override
  void dispose() {
    correoCtrl.dispose();
    passCtrl.dispose();
    usuarioCtrl.dispose();
    edadCtrl.dispose();
    profesionCtrl.dispose();
    bioCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Bienvenido a Trazzo',
                  style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w800, color: grisOscuro,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  'Donde la creatividad cobra vida',
                  style: TextStyle(fontSize: 14, color: grisMedio),
                ),
              ),
              const SizedBox(height: 16),

              
              TituloSeccion(
                'Información básica',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: grisOscuro,
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
              ),
              const SizedBox(height: 8),

              CampoIconoEtiqueta(
                icono: Icons.lock_outline,
                etiqueta: 'Contraseña',
                hint: 'Mínimo 6 caracteres',
                controller: passCtrl,
                esPassword: true,
                labelStyle: TextStyle(color: grisOscuro, fontWeight: FontWeight.w600),
                iconColor: grisOscuro,
                inputDecoration: InputDecoration(
                  hintText: 'Mínimo 6 caracteres',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CampoIconoEtiqueta(
                      icono: Icons.person_outline,
                      etiqueta: 'Usuario',
                      hint: 'nombre_artista',
                      controller: usuarioCtrl,
                      labelStyle: TextStyle(color: grisOscuro, fontWeight: FontWeight.w600),
                      iconColor: grisOscuro,
                      inputDecoration: InputDecoration(
                        hintText: 'nombre_artista',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: CampoIconoEtiqueta(
                      icono: Icons.calendar_today,
                      etiqueta: 'Edad',
                      hint: '18',
                      controller: edadCtrl,
                      teclado: TextInputType.number,
                      labelStyle: TextStyle(color: grisOscuro, fontWeight: FontWeight.w600),
                      iconColor: grisOscuro,
                      inputDecoration: InputDecoration(
                        hintText: '18',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              TituloSeccion(
                'Perfil artístico',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: grisOscuro,
                ),
              ),
              const SizedBox(height: 8),

              CampoIconoEtiqueta(
                icono: Icons.cases_outlined,
                etiqueta: 'Profesión / Ocupación',
                hint: 'Selecciona tu profesión',
                controller: profesionCtrl,
                labelStyle: TextStyle(color: grisOscuro, fontWeight: FontWeight.w600),
                iconColor: grisOscuro,
                inputDecoration: InputDecoration(
                  hintText: 'Selecciona tu profesión',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
                ),
              ),
              const SizedBox(height: 8),

              CampoIconoEtiqueta(
                icono: Icons.description_outlined,
                etiqueta: 'Biografía',
                hint:
                    'Cuéntanos sobre ti, tu estilo artístico, experiencia y lo que te apasiona del arte',
                controller: bioCtrl,
                maxLineas: 3,
                labelStyle: TextStyle(color: grisOscuro, fontWeight: FontWeight.w600),
                iconColor: grisOscuro,
                inputDecoration: InputDecoration(
                  hintText:
                      'Cuéntanos sobre ti, tu estilo artístico, experiencia y lo que te apasiona del arte',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
                ),
              ),

              const SizedBox(height: 12),

              TituloSeccion(
                'Tus intereses artísticos',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: grisOscuro,
                ),
              ),
              const SizedBox(height: 8),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: intereses.map((txt) {
                  final sel = seleccionados.contains(txt);
                  return ChipInteres(
                    texto: txt,
                    seleccionado: sel,
                    onTap: () => setState(() {
                      sel ? seleccionados.remove(txt) : seleccionados.add(txt);
                    }),
                    bg: chipBg,
                    textStyle: TextStyle(
                      color: grisOscuro, fontWeight: FontWeight.w600,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              Text(
                'Selecciona los tipos de arte que más te interesan',
                style: TextStyle(color: grisMedio),
              ),

              const SizedBox(height: 16),

             
              BotonApp(
                texto: 'Crear mi cuenta',
                onPressed: () => {
                  context.push('/login')
                },
                backgroundColor: verde,
                textStyle: const TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700,
                ),
                borderRadius: 30,
              ),
              const SizedBox(height: 8),
              DivisorConTexto(
                texto: 'o',
                color: Colors.grey[400],
                textStyle: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 8),
              BotonGoogle(
                onPressed: () {
                  
                },
                backgroundColor: Colors.white,
                textStyle: const TextStyle(
                  color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600,
                ),
                borderRadius: 12,
              ),
              const SizedBox(height: 8),


              const SizedBox(height: 12),
              Text(
                'Al registrarte, aceptas nuestros Términos de Servicio y Política de Privacidad',
                style: TextStyle(color: grisMedio, fontSize: 13),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}