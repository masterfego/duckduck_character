import 'package:duckduckgo/src/meta.dart';
import 'package:duckduckgo/src/related_topic.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(explicitToJson: true)
class Result extends Equatable {
  final String? abstract;
  final String? abstractSource;
  final String? abstractText;
  final String? abstractUrl;
  final String? answer;
  final String? answerType;
  final String? definition;
  final String? definitionSource;
  final String? definitionUrl;
  final String? entity;
  final String? heading;
  final String? image;
  final int? imageHeight;
  final int? imageIsLogo;
  final int? imageWidth;
  final String? infobox;
  final String? redirect;
  final List<RelatedTopic>? relatedTopics;
  final List<dynamic>? results;
  final String? type;
  final Meta? meta;

  const Result({
    this.abstract,
    this.abstractSource,
    this.abstractText,
    this.abstractUrl,
    this.answer,
    this.answerType,
    this.definition,
    this.definitionSource,
    this.definitionUrl,
    this.entity,
    this.heading,
    this.image,
    this.imageHeight,
    this.imageIsLogo,
    this.imageWidth,
    this.infobox,
    this.redirect,
    this.relatedTopics,
    this.results,
    this.type,
    this.meta,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  List<Object?> get props {
    return [
      abstract,
      abstractSource,
      abstractText,
      abstractUrl,
      answer,
      answerType,
      definition,
      definitionSource,
      definitionUrl,
      entity,
      heading,
      image,
      imageHeight,
      imageIsLogo,
      imageWidth,
      infobox,
      redirect,
      relatedTopics,
      results,
      type,
      meta,
    ];
  }
}
