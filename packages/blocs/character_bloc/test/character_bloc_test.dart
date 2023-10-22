import 'package:bloc_test/bloc_test.dart';
import 'package:character_bloc/character_bloc.dart';
import 'package:character_repository/character_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late CharacterBloc subject;
  late _MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = _MockCharacterRepository();

    when(() => mockCharacterRepository.getCharacters()).thenAnswer(
      (_) => Future.value([
        _stubCharacter1,
        _stubCharacter2,
      ]),
    );
    subject = CharacterBloc(repository: mockCharacterRepository);
  });

  group('CharacterBloc', () {
    group('CharacterStared', () {
      blocTest(
        'load the data sucessfully',
        build: () => subject,
        act: (bloc) => bloc.add(CharacterStarted()),
        expect: () => [
          _stubState.copyWith(state: LoadingState.loading),
          _stubState.copyWith(characters: [
            _stubCharacter1,
            _stubCharacter2,
          ], filteredCharacters: [
            _stubCharacter1,
            _stubCharacter2,
          ], state: LoadingState.completed)
        ],
      );

      blocTest(
        'fails if data is not available',
        build: () {
          when(() => mockCharacterRepository.getCharacters()).thenAnswer(
            (_) => Future.value(null),
          );
          return CharacterBloc(repository: mockCharacterRepository);
        },
        act: (bloc) => bloc.add(CharacterStarted()),
        expect: () => [
          _stubState.copyWith(state: LoadingState.loading),
          _stubState.copyWith(state: LoadingState.failure)
        ],
      );
    });

    group('CharactedSearched', () {
      blocTest(
        'filer the data',
        build: () => subject,
        seed: () => _stubState.copyWith(
          characters: [
            _stubCharacter1,
            _stubCharacter2,
          ],
        ),
        act: (bloc) => bloc.add(CharacterSearched(searchTerm: 'character1')),
        expect: () => [
          _stubState.copyWith(
            characters: [
              _stubCharacter1,
              _stubCharacter2,
            ],
            filteredCharacters: [
              _stubCharacter1,
            ],
            searchTerm: () => 'character1',
          )
        ],
      );

      blocTest(
        'return no result',
        build: () => subject,
        seed: () => _stubState.copyWith(
          characters: [
            _stubCharacter1,
            _stubCharacter2,
          ],
        ),
        act: (bloc) =>
            bloc.add(CharacterSearched(searchTerm: 'fake_search_term')),
        expect: () => [
          _stubState.copyWith(
            characters: [
              _stubCharacter1,
              _stubCharacter2,
            ],
            filteredCharacters: [],
            searchTerm: () => 'fake_search_term',
          )
        ],
      );
    });

    group('CharacterSearchCleared', () {
      blocTest(
        'filer the data',
        build: () => subject,
        seed: () => _stubState.copyWith(
          characters: [
            _stubCharacter1,
            _stubCharacter2,
          ],
          filteredCharacters: [
            _stubCharacter1,
          ],
          searchTerm: () => 'description1',
        ),
        act: (bloc) => bloc.add(CharacterSearchCleared()),
        expect: () => [
          _stubState.copyWith(
            characters: [
              _stubCharacter1,
              _stubCharacter2,
            ],
            filteredCharacters: [
              _stubCharacter1,
            ],
            searchTerm: () => null,
          ),
          _stubState.copyWith(
            characters: [
              _stubCharacter1,
              _stubCharacter2,
            ],
            filteredCharacters: [
              _stubCharacter1,
              _stubCharacter2,
            ],
            searchTerm: () => null,
          )
        ],
      );
    });

    group('CharacterSelected', () {
      blocTest(
        'select the character',
        build: () => subject,
        act: (bloc) => bloc.add(CharacterSelected(character: _stubCharacter2)),
        expect: () => [
          _stubState.copyWith(selectedCharacter: () => _stubCharacter2),
        ],
      );
    });
  });
}

const _stubCharacter1 = Character(
  title: 'character1',
  description: 'description1',
);

const _stubCharacter2 = Character(
  title: 'character2',
  description: 'description2',
);

const _stubState = CharacterState(
  characters: [],
  selectedCharacter: null,
  filteredCharacters: [],
  searchTerm: null,
  state: LoadingState.loading,
);

class _MockCharacterRepository extends Mock implements CharacterRepository {}
