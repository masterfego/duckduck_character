import 'package:duckduckgo/src/icon.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'related_topic.g.dart';

@JsonSerializable(explicitToJson: true)
class RelatedTopic extends Equatable {
  final String? firstUrl;
  final Icon? icon;
  final String? result;
  final String? text;

  const RelatedTopic({this.firstUrl, this.icon, this.result, this.text});

  factory RelatedTopic.fromJson(Map<String, dynamic> json) =>
      _$RelatedTopicFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedTopicToJson(this);

  @override
  List<Object?> get props => [firstUrl, icon, result, text];
}
