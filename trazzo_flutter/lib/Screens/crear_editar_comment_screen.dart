import 'package:flutter/material.dart';
import '../utils/util.dart';

class CrearEditarCommentScreen extends StatefulWidget {
  final String? id;
  final String obraId;
  final String? responseId;

  const CrearEditarCommentScreen({
    super.key,
    this.id,
    required this.obraId,
    this.responseId,
  });

  @override
  State<CrearEditarCommentScreen> createState() => _CrearEditarCommentScreenState();
}

class _CrearEditarCommentScreenState extends State<CrearEditarCommentScreen> {
  final Color fondo = const Color(0xFFF9FAFB);
  final Color verde = const Color(0xFF10C377);
  final Color grisOscuro = const Color(0xFF2C2C2C);
  final Color grisMedio = const Color(0xFF7A7A7A);

  final comentarioCtrl = TextEditingController();
  double calificacion = 3.0;
  String error = "";

  @override
  void dispose() {
    comentarioCtrl.dispose();
    super.dispose();
  }

  void publicar() {
    setState(() => error = "");

    if (comentarioCtrl.text.trim().isEmpty) {
      setState(() => error = "Por favor escribe un comentario");
      return;
    }

    //Simulación de envío
    debugPrint("Comentario: ${comentarioCtrl.text}");
    debugPrint("Calificación: $calificacion");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Comentario enviado correctamente"),
        backgroundColor: verde,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Obra ID: ${widget.obraId}");
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: Text(
          widget.id == null ? "Nuevo Comentario" : "Editar Comentario",
          style: TextStyle(color: grisOscuro, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: grisOscuro),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Campo del comentario
            CampoIconoEtiqueta(
              icono: Icons.edit,
              etiqueta: "Deja tu comentario aquí",
              hint: "Deja al autor conocer tu opinión",
              controller: comentarioCtrl,
              iconColor: grisOscuro,
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: grisOscuro,
              ),
              inputDecoration: InputDecoration(
                hintText: "Escribe aquí...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: grisMedio.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: grisMedio.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: verde, width: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 40),

            //Calificación
            Text(
              "Calificación: ${calificacion.toStringAsFixed(1)}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: grisOscuro,
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: verde,
                inactiveTrackColor: verde.withOpacity(0.3),
                thumbColor: verde,
                overlayColor: verde.withOpacity(0.1),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
              ),
              child: Slider(
                value: calificacion,
                onChanged: (v) => setState(() => calificacion = (v * 2).round() / 2),
                min: 0,
                max: 5,
                divisions: 10,
                label: calificacion.toStringAsFixed(1),
              ),
            ),

            if (error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            const SizedBox(height: 40),

            // Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotonApp(
                  texto: "Cancelar",
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: Colors.red[100]!,
                  textStyle: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  ancho: 160,
                  alto: 50,
                ),
                const SizedBox(width: 24),
                BotonApp(
                  texto: "Publicar",
                  onPressed: publicar,
                  backgroundColor: verde,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ancho: 160,
                  alto: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
