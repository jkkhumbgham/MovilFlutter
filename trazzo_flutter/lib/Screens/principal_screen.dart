import 'package:flutter/material.dart';
import '../utils/util.dart';

/// ===== Modelo =====
class Obra {
  final String obraId;
  final String artistaId;
  final String artistaNombre;
  final DateTime fecha;
  final String titulo;
  final String descripcion;
  final String imagenAsset;

  const Obra({
    required this.obraId,
    required this.artistaId,
    required this.artistaNombre,
    required this.fecha,
    required this.titulo,
    required this.descripcion,
    required this.imagenAsset,
  });
}

/// ===== Pantalla Principal =====
class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({
    super.key,
    this.onObraPressed,
    this.onPerfilPressed,
  });

  final void Function(String obraId)? onObraPressed;
  final void Function(String artistaId)? onPerfilPressed;

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  
  final Color fondo = const Color(0xFFF1FAF5);
  final Color verde = const Color(0xFF10C377);
  final Color grisOscuro = const Color(0xFF3E3E3E);
  final Color grisMedio = const Color(0xFF7A7A7A);
  final Color cardBg = Colors.white;
  final Color cardShadow = Colors.black12;

  bool isLoading = true;
  String? errorMessage;
  List<Obra> obras = [];


  @override
  void initState() {
    super.initState();
    _cargarObras();
  }

  void _cargarObras() {
      obras = [
        Obra(
          obraId: 'o1',
          artistaId: 'a1',
          artistaNombre: 'juan',
          fecha: DateTime(2025, 11, 05, 14, 27, 32, 456, 789),
          titulo: 'ajjajajaja',
          descripcion: 'obra',
          imagenAsset: 'assets/images/obra1.jpg',
        ),
        Obra(
          obraId: 'o2',
          artistaId: 'a2',
          artistaNombre: 'maría',
          fecha: DateTime(2025, 11, 04, 10, 12),
          titulo: 'Luz y piedra',
          descripcion: 'composición',
          imagenAsset: 'assets/images/obra2.jpg',
        ),
        Obra(
          obraId: 'o3',
          artistaId: 'a3',
          artistaNombre: 'diego',
          fecha: DateTime(2025, 11, 03, 18, 05),
          titulo: 'Retrato',
          descripcion: 'óleo',
          imagenAsset: 'assets/images/obra3.jpg',
        ),
      ];

      setState(() {
        isLoading = false;
      });
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: _barraSuperior(),
      body: _cuerpo(),
    );
  }

  PreferredSizeWidget _barraSuperior() {
    return AppBar(
      backgroundColor: fondo,
      elevation: 0,
      centerTitle: true,
      title: Image.asset('assets/images/trazzo.png', height: 28),
      actions: [
        const SizedBox(width: 8),
      ],
      iconTheme: IconThemeData(color: grisOscuro),
    );
  }

  

  Widget _cuerpo() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          BotonApp(
            texto: 'Busca tu inspiración',
            onPressed: () {

            },
            backgroundColor: verde,
            textStyle: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700,
            ),
            borderRadius: 26,
          ),
          const SizedBox(height: 10),

          Divider(color: Colors.grey[400], height: 20),
          const SizedBox(height: 8),


          Text(
            '¡Hola!👋',
            style: TextStyle(
              color: grisOscuro, fontWeight: FontWeight.bold, fontSize: 22,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Descubre nuevas obras de arte que te van a inspirar',
            style: TextStyle(color: grisMedio, fontSize: 14),
          ),
          const SizedBox(height: 16),

        
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: obras.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final obra = obras[index];
              return TarjetaPublicacion(
                obra: obra,
                onObraPressed: () => widget.onObraPressed?.call(obra.obraId),
                onPerfilPressed: () => widget.onPerfilPressed?.call(obra.artistaId),
                cardBg: cardBg,
                shadow: cardShadow,
                acento: verde,
                textoFuerte: grisOscuro,
                textoSuave: grisMedio,
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class TarjetaPublicacion extends StatelessWidget {
  const TarjetaPublicacion({
    super.key,
    required this.obra,
    required this.onObraPressed,
    required this.onPerfilPressed,
    required this.cardBg,
    required this.shadow,
    required this.acento,
    required this.textoFuerte,
    required this.textoSuave,
  });

  final Obra obra;
  final VoidCallback onObraPressed;
  final VoidCallback onPerfilPressed;

  final Color cardBg;
  final Color shadow;
  final Color acento;
  final Color textoFuerte;
  final Color textoSuave;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cardBg,
      elevation: 3,
      shadowColor: shadow,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onObraPressed,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: onPerfilPressed,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: acento.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.brush_outlined, color: acento, size: 18),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: onPerfilPressed,
                          child: Text(
                            obra.artistaNombre,
                            style: TextStyle(
                              color: textoFuerte, fontWeight: FontWeight.w700, fontSize: 14,
                            ),
                          ),
                        ),
                        Text(
                          obra.fecha.toString(),
                          style: TextStyle(color: textoSuave, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 8),

              
              if (obra.titulo.isNotEmpty)
                Text(
                  obra.titulo,
                  style: TextStyle(
                    color: textoFuerte, fontWeight: FontWeight.w800, fontSize: 16,
                  ),
                ),
              if (obra.descripcion.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(obra.descripcion, style: TextStyle(color: textoFuerte, fontSize: 14)),
              ],
              const SizedBox(height: 8),

              
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  obra.imagenAsset,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),

              
              Row(
                children: [
                  _AccionIcono(
                    icon: Icons.thumb_up_alt_outlined,
                    texto: '0',
                    color: textoSuave,
                  ),
                  const SizedBox(width: 12),
                  _AccionIcono(
                    icon: Icons.chat_bubble_outline,
                    texto: '0',
                    color: textoSuave,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.ios_share_outlined, color: textoSuave),
                    tooltip: 'Compartir',
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border, color: textoSuave),
                    tooltip: 'Guardar',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  
}

class _AccionIcono extends StatelessWidget {
  const _AccionIcono({
    required this.icon,
    required this.texto,
    required this.color,
  });

  final IconData icon;
  final String texto;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, color: color),
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
        ),
        const SizedBox(width: 4),
        Text(texto, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}