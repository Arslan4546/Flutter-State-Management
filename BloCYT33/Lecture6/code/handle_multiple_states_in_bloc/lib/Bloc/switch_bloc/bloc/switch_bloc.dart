import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
  }

  void _enableOrDisableNotification(
    EnableOrDisableNotification event,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
