import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'developer.g.dart';

@JsonSerializable(explicitToJson: true)
class Developer extends Equatable {
  final String? name;
  final String? type;
  final String? url;

  const Developer({this.name, this.type, this.url});

  factory Developer.fromJson(Map<String, dynamic> json) =>
      _$DeveloperFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperToJson(this);

  @override
  List<Object?> get props => [name, type, url];
}
