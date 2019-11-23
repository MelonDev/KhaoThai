part of 'sound_controller_bloc.dart';

@immutable
abstract class SoundControllerState {}

class InitialSoundControllerState extends SoundControllerState {
  @override
  String toString() {
    return "InitialAuthenticationState";
  }
}

class EnglishSoundControllerState extends SoundControllerState {
  @override
  String toString() {
    return "EnglishSoundControllerState";
  }
}

class ThaiSoundControllerState extends SoundControllerState {
  @override
  String toString() {
    return "ThaiSoundControllerState";
  }
}

class EmptySoundControllerState extends SoundControllerState {
  @override
  String toString() {
    return "EmptySoundControllerState";
  }
}

