import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasource/firebase_datasource.dart';
import '../model/chat.dart';
import '../model/remote_switch.dart';

final switchRepositoryProvider = Provider(
  (ref) => SwitchRepository(ref: ref),
);

class SwitchRepository {
  const SwitchRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Stream<Chat> listenChat(String id) async* {
    yield* _remote.listenChat(id).map(
          (event) => Chat(message: event.message),
        );
  }

  Stream<RemoteSwitch> listenRemoteSwitch(String id) async* {
    yield* _remote.listenRemoteSwitch(id).map(
          (event) => RemoteSwitch(
            switching: event.switching,
          ),
        );
  }

  Future<void> updateRemoteSwitch({
    required String id,
    required bool switching,
  }) async {
    final remoteSwitch = RemoteSwitch(switching: switching);
    await _remote.updateRemoteSwitch(id, remoteSwitch);
  }

}
