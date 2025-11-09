import 'package:flutter_bloc/flutter_bloc.dart';
import 'trending_event.dart';
import 'trending_state.dart';
import 'trending_screen.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(TrendingInitial()) {
    on<CargarTrending>((event, emit) async {
      emit(TrendingLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));

        final obras = [
          const ObraTrending(
            titulo: 'Sombras del alma',
            descripcion: 'Una exploración del color y la emoción.',
            artistaNombre: 'Valentina',
            fecha: 'Nov 2025',
            imagenAsset: 'assets/images/obra1.jpg',
          ),
          const ObraTrending(
            titulo: 'Luz en la noche',
            descripcion: 'Inspiración en la naturaleza y la calma.',
            artistaNombre: 'Carlos',
            fecha: 'Nov 2025',
            imagenAsset: 'assets/images/obra2.jpg',
          ),
          const ObraTrending(
            titulo: 'Sueños urbanos',
            descripcion: 'Una fusión de arte moderno y clásico.',
            artistaNombre: 'Ana',
            fecha: 'Nov 2025',
            imagenAsset: 'assets/images/obra3.jpg',
          ),
        ];

        emit(TrendingLoaded(obras));
      } catch (e) {
        emit(TrendingError('Error al cargar las tendencias: $e'));
      }
    });
  }
}
