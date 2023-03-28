import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_app/repository/switch_repository.dart';

import '../model/chat.dart';

final chatProvider = StreamProvider.autoDispose.family<Chat, String>(
      (ref, id) => ref.watch(switchRepositoryProvider).listenChat(id),
);