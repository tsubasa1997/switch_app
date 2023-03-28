import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_switch.freezed.dart';

part 'remote_switch.g.dart';

@freezed
class RemoteSwitch with _$RemoteSwitch {
  const factory RemoteSwitch({
    required bool switching,
  }) = _RemoteSwitch;

  factory RemoteSwitch.fromJson(Map<String, dynamic> json) => _$RemoteSwitchFromJson(json);
}