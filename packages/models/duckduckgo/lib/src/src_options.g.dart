// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'src_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SrcOptions _$SrcOptionsFromJson(Map<String, dynamic> json) => SrcOptions(
      directory: json['directory'] as String?,
      isFanon: json['isFanon'] as int?,
      isMediawiki: json['isMediawiki'] as int?,
      isWikipedia: json['isWikipedia'] as int?,
      language: json['language'] as String?,
      minAbstractLength: json['minAbstractLength'] as String?,
      skipAbstract: json['skipAbstract'] as int?,
      skipAbstractParen: json['skipAbstractParen'] as int?,
      skipEnd: json['skipEnd'] as String?,
      skipIcon: json['skipIcon'] as int?,
      skipImageName: json['skipImageName'] as int?,
      skipQr: json['skipQr'] as String?,
      sourceSkip: json['sourceSkip'] as String?,
      srcInfo: json['srcInfo'] as String?,
    );

Map<String, dynamic> _$SrcOptionsToJson(SrcOptions instance) =>
    <String, dynamic>{
      'directory': instance.directory,
      'isFanon': instance.isFanon,
      'isMediawiki': instance.isMediawiki,
      'isWikipedia': instance.isWikipedia,
      'language': instance.language,
      'minAbstractLength': instance.minAbstractLength,
      'skipAbstract': instance.skipAbstract,
      'skipAbstractParen': instance.skipAbstractParen,
      'skipEnd': instance.skipEnd,
      'skipIcon': instance.skipIcon,
      'skipImageName': instance.skipImageName,
      'skipQr': instance.skipQr,
      'sourceSkip': instance.sourceSkip,
      'srcInfo': instance.srcInfo,
    };
