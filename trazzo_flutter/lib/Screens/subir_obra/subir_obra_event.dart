import 'package:equatable/equatable.dart';

abstract class SubirObraEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubirObraPressed extends SubirObraEvent {
  final String titulo;
  final String descripcion;

  SubirObraPressed(this.titulo, this.descripcion);

  @override
  List<Object?> get props => [titulo, descripcion];
}
