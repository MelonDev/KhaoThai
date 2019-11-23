import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sound_controller_event.dart';

part 'sound_controller_state.dart';

class SoundControllerBloc
    extends Bloc<SoundControllerEvent, SoundControllerState> {
  @override
  SoundControllerState get initialState => InitialSoundControllerState();

  @override
  Stream<SoundControllerState> mapEventToState(
      SoundControllerEvent event) async* {
    if (event is StandbyEvent) {
      yield* _mapStandbyToState();
    }else if (event is EnglishTabSelectedEvent) {
      yield* _mapEnglishToState();
    } else if (event is ThaiTabSelectedEvent) {
      yield* _mapThaiToState();
    }
  }

  Stream<SoundControllerState> _mapStandbyToState() async* {
    print("HELLOS");
    yield EmptySoundControllerState();
  }

  Stream<SoundControllerState> _mapEnglishToState() async* {
    print("ENGS");
    yield EnglishSoundControllerState();
  }

  Stream<SoundControllerState> _mapThaiToState() async* {
    print("THAIS");
    yield ThaiSoundControllerState();
  }
}
