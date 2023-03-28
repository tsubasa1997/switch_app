import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasource/auth_datasource.dart';
import '../datasource/firebase_datasource.dart';

final authRepositoryProvider = Provider(
      (ref) => AuthRepository(ref: ref),
);

class AuthRepository {
  const AuthRepository({required this.ref});

  final Ref ref;

  AuthDatasource get _auth => ref.read(authDatasourceProvider);

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

}