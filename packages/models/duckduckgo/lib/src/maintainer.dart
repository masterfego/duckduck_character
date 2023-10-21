import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'maintainer.g.dart';

@JsonSerializable(explicitToJson: true)
class Maintainer extends Equatable {
  final String? github;

  const Maintainer({this.github});

  factory Maintainer.fromJson(Map<String, dynamic> json) =>
      _$MaintainerFromJson(json);

  Map<String, dynamic> toJson() => _$MaintainerToJson(this);

  @override
  List<Object?> get props => [github];
}
