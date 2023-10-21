import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'src_options.g.dart';

@JsonSerializable(explicitToJson: true)
class SrcOptions extends Equatable {
  final String? directory;
  final int? isFanon;
  final int? isMediawiki;
  final int? isWikipedia;
  final String? language;
  final String? minAbstractLength;
  final int? skipAbstract;
  final int? skipAbstractParen;
  final String? skipEnd;
  final int? skipIcon;
  final int? skipImageName;
  final String? skipQr;
  final String? sourceSkip;
  final String? srcInfo;

  const SrcOptions({
    this.directory,
    this.isFanon,
    this.isMediawiki,
    this.isWikipedia,
    this.language,
    this.minAbstractLength,
    this.skipAbstract,
    this.skipAbstractParen,
    this.skipEnd,
    this.skipIcon,
    this.skipImageName,
    this.skipQr,
    this.sourceSkip,
    this.srcInfo,
  });

  factory SrcOptions.fromJson(Map<String, dynamic> json) =>
      _$SrcOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SrcOptionsToJson(this);

  @override
  List<Object?> get props {
    return [
      directory,
      isFanon,
      isMediawiki,
      isWikipedia,
      language,
      minAbstractLength,
      skipAbstract,
      skipAbstractParen,
      skipEnd,
      skipIcon,
      skipImageName,
      skipQr,
      sourceSkip,
      srcInfo,
    ];
  }
}
