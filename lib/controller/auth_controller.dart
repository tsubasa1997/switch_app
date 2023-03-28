import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final authProvider = Provider(
      (ref) => AuthController(ref: ref),
);

class AuthController {
  const AuthController({required this.ref});

  final Ref ref;

  AuthRepository get _repository => ref.read(authRepositoryProvider);


}