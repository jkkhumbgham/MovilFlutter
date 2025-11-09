import 'package:equatable/equatable.dart';

abstract class SubirObraState extends Equatable {
  const SubirObraState();

  @override
  List<Object?> get props => [];
}

class SubirObraInitial extends SubirObraState {}

class SubirObraLoading extends SubirObraState {}

class SubirObraSuccess extends SubirObraState {}

class SubirObraFailure extends SubirObraState {
  final String error;

  const SubirObraFailure(this.error);

  @override
  List<Object?> get props => [error];
}
