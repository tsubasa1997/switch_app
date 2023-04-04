import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasource/firebase_datasource.dart';
import '../model/remote_switch.dart';

final switchRepositoryProvider = Provider(
  (ref) => SwitchRepository(ref: ref),
);

class SwitchRepository {
  const SwitchRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Stream<RemoteSwitch> listenRemoteSwitch(String id) async* {
    yield* _remote.listenRemoteSwitch(id).map(
          (event) => RemoteSwitch(
            switching: event.switching,
            temp: event.temp,
            mode: event.mode,
          ),
        );
  }

  Future<void> updateRemoteSwitch({
    required String id,
    required bool switching,
    required int temp,
    required bool mode,
  }) async {
    final remoteSwitch = RemoteSwitch(switching: switching, temp: temp, mode: mode,);
    await _remote.updateRemoteSwitch(id, remoteSwitch);
  }

}
