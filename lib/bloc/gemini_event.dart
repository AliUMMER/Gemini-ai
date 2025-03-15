part of 'gemini_bloc.dart';

@immutable
abstract class GeminiEvent {}

class fetchgemini extends GeminiEvent {
  final String message;

  fetchgemini({required this.message});
}
