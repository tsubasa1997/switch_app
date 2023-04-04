import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:switch_app/common/not_find_user_exception.dart';
import '../model/remote_switch.dart';

final firestoreDatasourceProvider = Provider(
  (_) => FirestoreDatasource(),
);

class FirestoreDatasource {
  final _db = FirebaseFirestore.instance;

  static const remoteSwitchCollectionId = 'remoteSwitch';
  static const switchingCollectionId = 'switching';



  Stream<RemoteSwitch> listenRemoteSwitch(String id) async* {
    final ref = _db.collection(remoteSwitchCollectionId).doc(id);
    final snap = ref.snapshots();
    yield* snap.map((event) {
      final json = event.data();
      if(json == null){
        throw NotFindReferenceException(ref: ref);
      }
      return RemoteSwitch.fromJson(json);
    });
  }
  
  Future<void> updateRemoteSwitch(String id,RemoteSwitch remoteSwitch,) async {
    final ref= _db
        .collection(remoteSwitchCollectionId)
        .doc(id);
    await ref.update(remoteSwitch.toJson());
  }



}


