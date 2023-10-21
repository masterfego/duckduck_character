import 'package:character_repository/src/models/models.dart' as model;
import 'package:duckduckgo/duckduckgo.dart' as api;

extension CharacterConversion on api.Result {
  List<model.Character> getCharacterModels() {
    if (relatedTopics != null) {
      final characters = relatedTopics!.getCharacterModels();

      // Sort alphabetically by title
      characters.sort(
        (a, b) => b.title.compareTo(a.title),
      );
    }
    return [];
  }
}

extension RelatedTopicConvertion on api.RelatedTopic {
  model.Character? getCharacterModel() {
    const baseUrl = 'https://duckduckgo.com/';

    if (firstUrl == null || text == null) {
      // INFO: conversion failures can also be logged
      return null;
    }
    final title = firstUrl!.replaceAll(baseUrl, '');
    final imageUrl = icon?.url != null ? baseUrl + icon!.url! : null;

    return model.Character(
      title: title,
      description: text!,
      imageUrl: imageUrl,
    );
  }
}

extension RelatedTopicListConvertion on List<api.RelatedTopic> {
  List<model.Character> getCharacterModels() {
    final characters = <model.Character>[];

    for (final relatedTopic in this) {
      final character = relatedTopic.getCharacterModel();
      if (character != null) {
        characters.add(character);
      }
    }
    return characters;
  }
}
