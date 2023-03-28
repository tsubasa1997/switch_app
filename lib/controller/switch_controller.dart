import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/switch_repository.dart';

part 'switch_controller.freezed.dart';

final switchStateProvider = StateNotifierProvider<SwitchStateNotifier, SwitchState>(
  (read) => SwitchStateNotifier(ref: read),
);

@freezed
class SwitchState with _$SwitchState {
  const factory SwitchState({
    required bool switching,
  }) = _SwitchState;
}

class SwitchStateNotifier extends StateNotifier<SwitchState> {
  SwitchStateNotifier({required this.ref}) : super(const SwitchState(switching: false));
  final Ref ref;

  SwitchRepository get _repository => ref.read(switchRepositoryProvider);

  Future<void> updateRemoteSwitch({
    required String id,
    required bool switching,
  }) async {
    await _repository.updateRemoteSwitch(id: id, switching: switching);
  }
}
