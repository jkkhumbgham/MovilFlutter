import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Modelo de Obra
class Obra {
  final String obraId;
  final String titulo;
  final String descripcion;

  Obra({required this.obraId, required this.titulo, required this.descripcion});
}

// Estado
class PublicacionesGuardadasState extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  List<Obra> obras = [];

  Future<void> getObras() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 2));
      obras = [
        Obra(
          obraId: '1',
          titulo: 'Origami de grulla',
          descripcion: 'Una pieza tradicional japonesa.',
        ),
        Obra(
          obraId: '2',
          titulo: 'Escultura moderna',
          descripcion: 'Obra contemporánea en metal.',
        ),
      ];

      if (obras.isEmpty) {
        throw Exception('No se encontraron obras para mostrar.');
      }

    } catch (e) {
      errorMessage = 'Error al cargar las obras: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

// Widget principal
class PublicacionesGuardadasScreen extends StatelessWidget {
  final void Function(String obraId)? onObraPressed;

  const PublicacionesGuardadasScreen({super.key, this.onObraPressed});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PublicacionesGuardadasState()..getObras(),
      child: Consumer<PublicacionesGuardadasState>(
        builder: (context, state, _) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => state.getObras(),
                    child: const Text("Reintentar"),
                  ),
                ],
              ),
            );
          }

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Publicaciones guardadas",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Categorías
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CategoriaChip(texto: "Inicio"),
                        CategoriaChip(texto: "Trending"),
                        CategoriaChip(texto: "Origami"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Lista de publicaciones
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.obras.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final obra = state.obras[index];
                        return TarjetaPublicacion(
                          obra: obra,
                          onTap: () => onObraPressed?.call(obra.obraId),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Chip de categoría
class CategoriaChip extends StatelessWidget {
  final String texto;
  const CategoriaChip({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontSize: 14,
        ),
      ),
    );
  }
}

// Tarjeta de publicación
class TarjetaPublicacion extends StatelessWidget {
  final Obra obra;
  final VoidCallback? onTap;

  const TarjetaPublicacion({super.key, required this.obra, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          obra.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(obra.descripcion),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
