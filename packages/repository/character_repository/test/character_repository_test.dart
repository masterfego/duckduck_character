import 'package:character_api/character_api.dart';
import 'package:character_repository/character_repository.dart';
import 'package:duckduckgo/duckduckgo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late CharacterRepository subject;
  late _MockCharacterApiClient mockCharacterApiClient;

  group('CharacterRepository', () {
    setUp(() {
      mockCharacterApiClient = _MockCharacterApiClient();
      when(() => mockCharacterApiClient.getCharaters())
          .thenAnswer((_) => Future.value(_stubResult));

      subject = CharacterRepository(apiClient: mockCharacterApiClient);
    });
    test('get the data and return converted object', () async {
      final result = await subject.getCharacters();
      expect(result, isNotNull);
      expect(result?.length, 2);

      expect(result?[0].title, 'Fake Name1');
      expect(result?[0].imageUrl, 'https://duckduckgo.com/image_url1');
      expect(result?[0].description, 'description1');

      expect(result?[1].title, 'Fake Name2');
      expect(result?[1].imageUrl, null);
      expect(result?[1].description, 'description2');
    });
  });

  group('CharacterRepository', () {
    setUp(() {
      mockCharacterApiClient = _MockCharacterApiClient();
      when(() => mockCharacterApiClient.getCharaters())
          .thenAnswer((_) => Future.value(_stubWrongResult));

      subject = CharacterRepository(apiClient: mockCharacterApiClient);
    });

    test('get the data and skip wrong data', () async {
      final result = await subject.getCharacters();
      expect(result, isNotNull);
      expect(result?.length, 0);
    });
  });

  group('CharacterRepository', () {
    setUp(() {
      mockCharacterApiClient = _MockCharacterApiClient();
      when(() => mockCharacterApiClient.getCharaters())
          .thenAnswer((_) => Future.value(null));

      subject = CharacterRepository(apiClient: mockCharacterApiClient);
    });

    test('get the data and return null if the data are wrong', () async {
      final result = await subject.getCharacters();
      expect(result, isNull);
    });
  });
}

const _stubRelatedTopic1 = RelatedTopic(
  firstUrl: 'https://duckduckgo.com/Fake_Name1',
  icon: Icon(
    url: '/image_url1',
  ),
  text: 'description1',
);
const _stubRelatedTopic2 = RelatedTopic(
  firstUrl: 'https://duckduckgo.com/Fake_Name2',
  icon: Icon(
    url: '',
  ),
  text: 'description2',
);

const _stubResult = Result(
  relatedTopics: [
    _stubRelatedTopic1,
    _stubRelatedTopic2,
  ],
);

const _stubWrongRelatedTopic = RelatedTopic(
  firstUrl: null,
  icon: Icon(
    url: '',
  ),
  text: null,
);

const _stubWrongResult = Result(
  relatedTopics: [_stubWrongRelatedTopic],
);

class _MockCharacterApiClient extends Mock implements CharacterApiClient {}
