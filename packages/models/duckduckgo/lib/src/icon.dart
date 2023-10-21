import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'icon.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Icon extends Equatable {
  final String? height;
  @JsonKey(name: 'URL')
  final String? url;
  final String? width;

  const Icon({this.height, this.url, this.width});

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);

  Map<String, dynamic> toJson() => _$IconToJson(this);

  @override
  List<Object?> get props => [height, url, width];
}
