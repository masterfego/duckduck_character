// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      attribution: json['attribution'],
      blockgroup: json['blockgroup'],
      createdDate: json['createdDate'],
      description: json['description'] as String?,
      designer: json['designer'],
      devDate: json['devDate'],
      devMilestone: json['devMilestone'] as String?,
      developer: (json['developer'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      exampleQuery: json['exampleQuery'] as String?,
      id: json['id'] as String?,
      isStackexchange: json['isStackexchange'],
      jsCallbackName: json['jsCallbackName'] as String?,
      liveDate: json['liveDate'],
      maintainer: json['maintainer'] == null
          ? null
          : Maintainer.fromJson(json['maintainer'] as Map<String, dynamic>),
      name: json['name'] as String?,
      perlModule: json['perlModule'] as String?,
      producer: json['producer'],
      productionState: json['productionState'] as String?,
      repo: json['repo'] as String?,
      signalFrom: json['signalFrom'] as String?,
      srcDomain: json['srcDomain'] as String?,
      srcId: json['srcId'] as int?,
      srcName: json['srcName'] as String?,
      srcOptions: json['srcOptions'] == null
          ? null
          : SrcOptions.fromJson(json['srcOptions'] as Map<String, dynamic>),
      srcUrl: json['srcUrl'],
      status: json['status'] as String?,
      tab: json['tab'] as String?,
      topic:
          (json['topic'] as List<dynamic>?)?.map((e) => e as String).toList(),
      unsafe: json['unsafe'] as int?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'attribution': instance.attribution,
      'blockgroup': instance.blockgroup,
      'createdDate': instance.createdDate,
      'description': instance.description,
      'designer': instance.designer,
      'devDate': instance.devDate,
      'devMilestone': instance.devMilestone,
      'developer': instance.developer?.map((e) => e.toJson()).toList(),
      'exampleQuery': instance.exampleQuery,
      'id': instance.id,
      'isStackexchange': instance.isStackexchange,
      'jsCallbackName': instance.jsCallbackName,
      'liveDate': instance.liveDate,
      'maintainer': instance.maintainer?.toJson(),
      'name': instance.name,
      'perlModule': instance.perlModule,
      'producer': instance.producer,
      'productionState': instance.productionState,
      'repo': instance.repo,
      'signalFrom': instance.signalFrom,
      'srcDomain': instance.srcDomain,
      'srcId': instance.srcId,
      'srcName': instance.srcName,
      'srcOptions': instance.srcOptions?.toJson(),
      'srcUrl': instance.srcUrl,
      'status': instance.status,
      'tab': instance.tab,
      'topic': instance.topic,
      'unsafe': instance.unsafe,
    };
