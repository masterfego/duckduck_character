// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedTopic _$RelatedTopicFromJson(Map<String, dynamic> json) => RelatedTopic(
      firstUrl: json['firstUrl'] as String?,
      icon: json['icon'] == null
          ? null
          : Icon.fromJson(json['icon'] as Map<String, dynamic>),
      result: json['result'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$RelatedTopicToJson(RelatedTopic instance) =>
    <String, dynamic>{
      'firstUrl': instance.firstUrl,
      'icon': instance.icon?.toJson(),
      'result': instance.result,
      'text': instance.text,
    };
