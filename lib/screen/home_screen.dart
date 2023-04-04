import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_app/controller/switch_controller.dart';
import 'package:switch_app/providers/remote_switch_provider.dart';
import 'package:switch_app/screen/remote_controller_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final remoteSwitchState = ref.watch(remoteSwitchProvider(widget.id));
    return remoteSwitchState.when(
      data: (remoteSwitch) {
        if(remoteSwitch.switching == false){
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
                        temp: remoteSwitch.temp,
                        mode: remoteSwitch.mode,
                      );
                    },
                    style: ElevatedButton.styleFrom(onPrimary: Colors.black),
                    child: const Text(
                      'ON',
                      style: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return RemoteControllerScreen(id: widget.id);
        }
      },
      error: (e, _) => const Text('error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
