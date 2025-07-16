import 'package:bloc_course/bloc/switchbloc/switch_bloc.dart';
import 'package:bloc_course/bloc/switchbloc/switch_event.dart';
import 'package:bloc_course/bloc/switchbloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (prev, current) =>
                      prev.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        context.read<SwitchBloc>().add(
                          EnableOrDisableNotifications(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (prev, current) => prev.slider != current.slider,
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withValues(alpha: state.slider),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (prev, current) => prev.slider != current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (newValue) {
                    context.read<SwitchBloc>().add(
                      SliderEnabled(slider: newValue),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
