import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_app/controller/switch_controller.dart';
import 'package:switch_app/providers/remote_switch_provider.dart';
import 'package:switch_app/providers/switch_provider.dart';

class RemoteControllerScreen extends ConsumerStatefulWidget {
  const RemoteControllerScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<RemoteControllerScreen> createState() => _RemoteControllerScreenState();
}

class _RemoteControllerScreenState extends ConsumerState<RemoteControllerScreen> {
  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider(widget.id));
    final remoteSwitchState = ref.watch(remoteSwitchProvider(widget.id));
    return remoteSwitchState.when(
      data: (remoteSwitch) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  remoteSwitch.switching ? '機動中' : '停止中',
                  style: const TextStyle(
                    fontSize: 70,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(switchStateProvider.notifier).updateRemoteSwitch(
                          id: widget.id,
                          switching: !remoteSwitch.switching,
                        );
                  },
                  style: ElevatedButton.styleFrom(onPrimary: Colors.black),
                  child: Text(
                    remoteSwitch.switching ? 'OFF' : 'ON',
                    style: const TextStyle(fontSize: 80, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (e, _) => Text('error'),
      loading: () => CircularProgressIndicator(),
    );
  }
}
