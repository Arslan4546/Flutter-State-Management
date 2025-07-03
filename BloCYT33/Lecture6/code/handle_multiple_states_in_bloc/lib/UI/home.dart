import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handle_multiple_states_in_bloc/Bloc/switch_bloc/bloc/switch_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.isSwitch,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(
                      EnableOrDisableNotification(),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 200, height: 200, color: Colors.blue),
            ),
            Slider(
              value: 0.5,
              onChanged: (value) {
                // Handle slider change
              },
            ),
          ],
        ),
      ),
    );
  }
}
