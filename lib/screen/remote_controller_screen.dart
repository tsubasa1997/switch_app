import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_app/providers/remote_switch_provider.dart';

import '../controller/switch_controller.dart';

class RemoteControllerScreen extends ConsumerStatefulWidget {
  const RemoteControllerScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<RemoteControllerScreen> createState() => _RemoteControllerScreenState();
}

class _RemoteControllerScreenState extends ConsumerState<RemoteControllerScreen> {
  @override
  Widget build(BuildContext context) {
    final remoteSwitchState = ref.watch(remoteSwitchProvider(widget.id));
    return remoteSwitchState.when(
      data: (remoteSwitch) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('起動中'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 70,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(double.infinity),
                              bottomLeft: Radius.circular(double.infinity),
                            ),
                          ),
                        ),
                        onPressed: () {
                          ref.read(switchStateProvider.notifier).updateRemoteSwitch(
                                id: widget.id,
                                switching: remoteSwitch.switching,
                                temp: remoteSwitch.temp - 1,
                                mode: remoteSwitch.mode,
                              );
                        },
                        child: const Text(
                          '−',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 120,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Text(
                          '${remoteSwitch.temp}°',
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 70,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(double.infinity),
                              bottomRight: Radius.circular(double.infinity),
                            ),
                          ),
                        ),
                        onPressed: () {
                          ref.read(switchStateProvider.notifier).updateRemoteSwitch(
                            id: widget.id,
                            switching: remoteSwitch.switching,
                            temp: remoteSwitch.temp + 1,
                            mode: remoteSwitch.mode,
                          );
                        },
                        child: const Text(
                          '＋',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Text(
                          remoteSwitch.mode ? '暖房' : '冷房',
                          style: TextStyle(
                            fontSize: 20,
                            color: remoteSwitch.mode ? Colors.deepOrange : Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(switchStateProvider.notifier).updateRemoteSwitch(
                              id: widget.id,
                              switching: remoteSwitch.switching,
                              temp: remoteSwitch.temp,
                              mode: !remoteSwitch.mode,
                            );
                      },
                      child: const Text(
                        'Change',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
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
      error: (e, _) => const Text('error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
