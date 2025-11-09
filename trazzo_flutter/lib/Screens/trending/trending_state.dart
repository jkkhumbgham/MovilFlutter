import 'package:equatable/equatable.dart';
import 'trending_screen.dart';

abstract class TrendingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<ObraTrending> obrasTrending;

  TrendingLoaded(this.obrasTrending);

  @override
  List<Object?> get props => [obrasTrending];
}

class TrendingError extends TrendingState {
  final String mensaje;

  TrendingError(this.mensaje);

  @override
  List<Object?> get props => [mensaje];
}
