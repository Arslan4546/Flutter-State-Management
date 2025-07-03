part of 'switch_bloc.dart';

@immutable
class SwitchState extends Equatable {
  final bool isSwitch;
  const SwitchState({this.isSwitch = false});

  @override
  List<Object?> get props => [isSwitch];

  SwitchState copyWith({bool? isSwitch}) {
    return SwitchState(isSwitch: isSwitch ?? this.isSwitch);
  }
}
