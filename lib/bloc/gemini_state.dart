part of 'gemini_bloc.dart';

@immutable
abstract class GeminiState {}

class GemeniInitial extends GeminiState {}

class GemeniblocLoading extends GeminiState {}

class GemeniblocLoaded extends GeminiState {}

class GeminiblocError extends GeminiState {}
