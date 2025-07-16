import 'package:bloc/bloc.dart';
import 'package:bloc_course/bloc/switchbloc/switch_event.dart';
import 'package:bloc_course/bloc/switchbloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotifications>(_enableOrDisableNotifications);
    on<SliderEnabled>(_enabledSlider);
  }

  void _enableOrDisableNotifications(
    EnableOrDisableNotifications events,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _enabledSlider(SliderEnabled events, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
