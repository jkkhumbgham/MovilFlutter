import 'package:flutter_bloc/flutter_bloc.dart';
import 'subir_obra_event.dart';
import 'subir_obra_state.dart';

class SubirObraBloc extends Bloc<SubirObraEvent, SubirObraState> {
  SubirObraBloc() : super(SubirObraInitial()) {
    on<SubirObraPressed>((event, emit) async {
      emit(SubirObraLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        
        emit(SubirObraSuccess());
      } catch (e) {
        emit(SubirObraFailure(e.toString()));
      }
    });
  }
}
