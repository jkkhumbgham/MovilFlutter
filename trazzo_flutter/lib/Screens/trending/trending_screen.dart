import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trazzo_flutter/Screens/trending/trending_bloc.dart';
import 'package:trazzo_flutter/Screens/trending/trending_event.dart';
import 'package:trazzo_flutter/Screens/trending/trending_state.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrendingBloc()..add(CargarTrending()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tendencias'),
          backgroundColor: const Color(0xFFF1FAF5),
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFF1FAF5),
        body: BlocBuilder<TrendingBloc, TrendingState>(
          builder: (context, state) {
            if (state is TrendingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TrendingLoaded) {
              final obras = state.obrasTrending;

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: obras.length,
                itemBuilder: (context, index) {
                  final obra = obras[index];
                  return _TarjetaTrending(obra: obra);
                },
              );
            } else if (state is TrendingError) {
              return Center(child: Text(state.mensaje));
            }
            return const Center(child: Text('Cargando tendencias...'));
          },
        ),
      ),
    );
  }
}

class _TarjetaTrending extends StatelessWidget {
  final ObraTrending obra;

  const _TarjetaTrending({required this.obra});

  @override
  Widget build(BuildContext context) {
    const Color fondo = Color(0xFFF1FAF5);
    const Color morado = Color(0xFF7A3E9D); 
    const Color grisOscuro = Color(0xFF3E3E3E);
    const Color grisMedio = Color(0xFF7A7A7A);

    return Material(
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.black12,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: morado.withOpacity(0.18),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.trending_up, color: morado, size: 18),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    obra.artistaNombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: grisOscuro,
                    ),
                  ),
                ),
                Text(
                  obra.fecha,
                  style: const TextStyle(color: grisMedio, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),

            //Título y descripción 
            Text(
              obra.titulo,
              style: const TextStyle(
                color: grisOscuro,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              obra.descripcion,
              style: const TextStyle(color: grisOscuro, fontSize: 14),
            ),
            const SizedBox(height: 8),

            //Imagen
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

            // Botones
            Row(
              children: [
                _AccionIcono(
                    icon: Icons.thumb_up_alt_outlined,
                    texto: '0',
                    color: grisMedio),
                const SizedBox(width: 12),
                _AccionIcono(
                    icon: Icons.chat_bubble_outline,
                    texto: '0',
                    color: grisMedio),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ios_share_outlined, color: grisMedio),
                  tooltip: 'Compartir',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border, color: grisMedio),
                  tooltip: 'Guardar',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AccionIcono extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color;

  const _AccionIcono({
    required this.icon,
    required this.texto,
    required this.color,
  });

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

class ObraTrending {
  final String titulo;
  final String descripcion;
  final String artistaNombre;
  final String fecha;
  final String imagenAsset;

  const ObraTrending({
    required this.titulo,
    required this.descripcion,
    required this.artistaNombre,
    required this.fecha,
    required this.imagenAsset,
  });
}
