import 'package:bloc/bloc.dart';
import 'package:gemeni_ai/model_class/gemini_model.dart';
import 'package:meta/meta.dart';

import '../repositery/api/gemani_api.dart';

part 'gemini_event.dart';
part 'gemini_state.dart';

class GeminiBloc extends Bloc<GeminiEvent, GeminiState> {
  GemaniApi gemeniapi = GemaniApi();
  late GeminiModel geminiModel;

  GeminiBloc() : super(GemeniInitial()) {
    on<fetchgemini>((event, emit) async {
      emit(GemeniblocLoading());
      try {
        geminiModel = await gemeniapi.getTranslate(event.message);
        emit(GemeniblocLoaded());
      } catch (e) {
        print(e);
        emit(GeminiblocError());
      }
    });
  }
}
