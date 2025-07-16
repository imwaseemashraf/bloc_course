import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotifications extends SwitchEvent {}

class SliderEnabled extends SwitchEvent {
  final double slider;

  const SliderEnabled({required this.slider});

  @override
  // TODO: implement props
  List<Object?> get props => [slider];
}
