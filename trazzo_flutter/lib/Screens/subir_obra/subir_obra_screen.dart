import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'subir_obra_bloc.dart';
import 'subir_obra_event.dart';
import 'subir_obra_state.dart';

class SubirObraScreen extends StatelessWidget {
  const SubirObraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tituloCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    return BlocProvider(
      create: (_) => SubirObraBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Subir Obra")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<SubirObraBloc, SubirObraState>(
            listener: (context, state) {
              if (state is SubirObraSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Obra subida con éxito")),
                );
                tituloCtrl.clear();
                descCtrl.clear();
              } else if (state is SubirObraFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              if (state is SubirObraLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  TextField(
                    controller: tituloCtrl,
                    decoration: const InputDecoration(labelText: "Título"),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descCtrl,
                    decoration: const InputDecoration(labelText: "Descripción"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final titulo = tituloCtrl.text.trim();
                      final descripcion = descCtrl.text.trim();
                      if (titulo.isNotEmpty && descripcion.isNotEmpty) {
                        context.read<SubirObraBloc>().add(
                              SubirObraPressed(titulo, descripcion),
                            );
                      }
                    },
                    child: const Text("Subir obra"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
