// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_switch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteSwitch _$RemoteSwitchFromJson(Map<String, dynamic> json) {
  return _RemoteSwitch.fromJson(json);
}

/// @nodoc
mixin _$RemoteSwitch {
  bool get switching => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteSwitchCopyWith<RemoteSwitch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteSwitchCopyWith<$Res> {
  factory $RemoteSwitchCopyWith(
          RemoteSwitch value, $Res Function(RemoteSwitch) then) =
      _$RemoteSwitchCopyWithImpl<$Res, RemoteSwitch>;
  @useResult
  $Res call({bool switching});
}

/// @nodoc
class _$RemoteSwitchCopyWithImpl<$Res, $Val extends RemoteSwitch>
    implements $RemoteSwitchCopyWith<$Res> {
  _$RemoteSwitchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? switching = null,
  }) {
    return _then(_value.copyWith(
      switching: null == switching
          ? _value.switching
          : switching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemoteSwitchCopyWith<$Res>
    implements $RemoteSwitchCopyWith<$Res> {
  factory _$$_RemoteSwitchCopyWith(
          _$_RemoteSwitch value, $Res Function(_$_RemoteSwitch) then) =
      __$$_RemoteSwitchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool switching});
}

/// @nodoc
class __$$_RemoteSwitchCopyWithImpl<$Res>
    extends _$RemoteSwitchCopyWithImpl<$Res, _$_RemoteSwitch>
    implements _$$_RemoteSwitchCopyWith<$Res> {
  __$$_RemoteSwitchCopyWithImpl(
      _$_RemoteSwitch _value, $Res Function(_$_RemoteSwitch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? switching = null,
  }) {
    return _then(_$_RemoteSwitch(
      switching: null == switching
          ? _value.switching
          : switching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoteSwitch with DiagnosticableTreeMixin implements _RemoteSwitch {
  const _$_RemoteSwitch({required this.switching});

  factory _$_RemoteSwitch.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteSwitchFromJson(json);

  @override
  final bool switching;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoteSwitch(switching: $switching)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RemoteSwitch'))
      ..add(DiagnosticsProperty('switching', switching));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteSwitch &&
            (identical(other.switching, switching) ||
                other.switching == switching));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, switching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoteSwitchCopyWith<_$_RemoteSwitch> get copyWith =>
      __$$_RemoteSwitchCopyWithImpl<_$_RemoteSwitch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteSwitchToJson(
      this,
    );
  }
}

abstract class _RemoteSwitch implements RemoteSwitch {
  const factory _RemoteSwitch({required final bool switching}) =
      _$_RemoteSwitch;

  factory _RemoteSwitch.fromJson(Map<String, dynamic> json) =
      _$_RemoteSwitch.fromJson;

  @override
  bool get switching;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteSwitchCopyWith<_$_RemoteSwitch> get copyWith =>
      throw _privateConstructorUsedError;
}
