part of 'switch_bloc.dart';

@immutable
sealed class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class EnableOrDisableNotification extends SwitchEvent {
  const EnableOrDisableNotification();
}
