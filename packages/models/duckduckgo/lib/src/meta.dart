import 'package:duckduckgo/src/developer.dart';
import 'package:duckduckgo/src/maintainer.dart';
import 'package:duckduckgo/src/src_options.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable(explicitToJson: true)
class Meta extends Equatable {
  final dynamic attribution;
  final dynamic blockgroup;
  final dynamic createdDate;
  final String? description;
  final dynamic designer;
  final dynamic devDate;
  final String? devMilestone;
  final List<Developer>? developer;
  final String? exampleQuery;
  final String? id;
  final dynamic isStackexchange;
  final String? jsCallbackName;
  final dynamic liveDate;
  final Maintainer? maintainer;
  final String? name;
  final String? perlModule;
  final dynamic producer;
  final String? productionState;
  final String? repo;
  final String? signalFrom;
  final String? srcDomain;
  final int? srcId;
  final String? srcName;
  final SrcOptions? srcOptions;
  final dynamic srcUrl;
  final String? status;
  final String? tab;
  final List<String>? topic;
  final int? unsafe;

  const Meta({
    this.attribution,
    this.blockgroup,
    this.createdDate,
    this.description,
    this.designer,
    this.devDate,
    this.devMilestone,
    this.developer,
    this.exampleQuery,
    this.id,
    this.isStackexchange,
    this.jsCallbackName,
    this.liveDate,
    this.maintainer,
    this.name,
    this.perlModule,
    this.producer,
    this.productionState,
    this.repo,
    this.signalFrom,
    this.srcDomain,
    this.srcId,
    this.srcName,
    this.srcOptions,
    this.srcUrl,
    this.status,
    this.tab,
    this.topic,
    this.unsafe,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  @override
  List<Object?> get props {
    return [
      attribution,
      blockgroup,
      createdDate,
      description,
      designer,
      devDate,
      devMilestone,
      developer,
      exampleQuery,
      id,
      isStackexchange,
      jsCallbackName,
      liveDate,
      maintainer,
      name,
      perlModule,
      producer,
      productionState,
      repo,
      signalFrom,
      srcDomain,
      srcId,
      srcName,
      srcOptions,
      srcUrl,
      status,
      tab,
      topic,
      unsafe,
    ];
  }
}
