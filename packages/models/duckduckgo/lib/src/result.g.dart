// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      abstract: json['Abstract'] as String?,
      abstractSource: json['AbstractSource'] as String?,
      abstractText: json['AbstractText'] as String?,
      abstractUrl: json['AbstractUrl'] as String?,
      answer: json['Answer'] as String?,
      answerType: json['AnswerType'] as String?,
      definition: json['Definition'] as String?,
      definitionSource: json['DefinitionSource'] as String?,
      definitionUrl: json['DefinitionUrl'] as String?,
      entity: json['Entity'] as String?,
      heading: json['Heading'] as String?,
      image: json['Image'] as String?,
      imageHeight: json['ImageHeight'] as int?,
      imageIsLogo: json['ImageIsLogo'] as int?,
      imageWidth: json['ImageWidth'] as int?,
      infobox: json['Infobox'] as String?,
      redirect: json['Redirect'] as String?,
      relatedTopics: (json['RelatedTopics'] as List<dynamic>?)
          ?.map((e) => RelatedTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      results: json['Results'] as List<dynamic>?,
      type: json['Type'] as String?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'Abstract': instance.abstract,
      'AbstractSource': instance.abstractSource,
      'AbstractText': instance.abstractText,
      'AbstractUrl': instance.abstractUrl,
      'Answer': instance.answer,
      'AnswerType': instance.answerType,
      'Definition': instance.definition,
      'DefinitionSource': instance.definitionSource,
      'DefinitionUrl': instance.definitionUrl,
      'Entity': instance.entity,
      'Heading': instance.heading,
      'Image': instance.image,
      'ImageHeight': instance.imageHeight,
      'ImageIsLogo': instance.imageIsLogo,
      'ImageWidth': instance.imageWidth,
      'Infobox': instance.infobox,
      'Redirect': instance.redirect,
      'RelatedTopics': instance.relatedTopics?.map((e) => e.toJson()).toList(),
      'Results': instance.results,
      'Type': instance.type,
      'meta': instance.meta?.toJson(),
    };
