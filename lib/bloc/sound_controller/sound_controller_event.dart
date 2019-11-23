part of 'sound_controller_bloc.dart';

@immutable
abstract class SoundControllerEvent {}

class StandbyEvent extends SoundControllerEvent {}

class EnglishTabSelectedEvent extends SoundControllerEvent {}

class ThaiTabSelectedEvent extends SoundControllerEvent {}

