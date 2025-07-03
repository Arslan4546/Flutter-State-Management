part of 'switch_bloc.dart';

@immutable
sealed class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class EnableOrDisableNotificationEvent extends SwitchEvent {
  const EnableOrDisableNotificationEvent();
}

@immutable
class SliderEvent extends SwitchEvent {
  final double slider;
  const SliderEvent({required this.slider});
}
