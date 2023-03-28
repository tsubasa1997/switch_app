import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_app/model/remote_switch.dart';
import 'package:switch_app/repository/switch_repository.dart';

final remoteSwitchProvider = StreamProvider.autoDispose.family<RemoteSwitch, String>(
      (ref, id) => ref.watch(switchRepositoryProvider).listenRemoteSwitch(id),
);