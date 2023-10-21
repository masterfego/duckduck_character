import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:character_repository/character_repository.dart';
import 'package:equatable/equatable.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository _repository;

  CharacterBloc({required CharacterRepository repository})
      : _repository = repository,
        super(
          const CharacterState(
            characters: [],
            filteredCharacters: [],
            searchTerm: null,
          ),
        ) {
    on<CharacterStarted>(_onCharacterStared, transformer: restartable());
    on<CharacterSearched>(_onCharacterSearched);
    on<CharacterSearchCleared>(_onCharacterSearchCleared);
  }

  Future _onCharacterStared(
    CharacterStarted event,
    Emitter<CharacterState> emit,
  ) async {
    final characters = await _repository.getCharacters();
    if (characters != null) {
      emit(state.copyWith(
        characters: characters,
        filteredCharacters: characters,
      ));
    }
  }

  void _onCharacterSearched(
    CharacterSearched event,
    Emitter<CharacterState> emit,
  ) {
    var filteredCharacters = <Character>[];
    final shoudlSearch = event.searchTerm.trim().isEmpty;

    if (!shoudlSearch) {
      filteredCharacters = state.characters;
    } else {
      filteredCharacters = state.characters
          .where(
            (character) =>
                character.title
                    .trim()
                    .toUpperCase()
                    .contains(event.searchTerm.trim().toUpperCase()) ||
                character.description
                    .trim()
                    .toUpperCase()
                    .contains(event.searchTerm.trim().toUpperCase()),
          )
          .toList();
    }

    emit(state.copyWith(
      filteredCharacters: filteredCharacters,
      searchTerm: () => shoudlSearch ? event.searchTerm : null,
    ));
  }

  void _onCharacterSearchCleared(
    CharacterSearchCleared event,
    Emitter<CharacterState> emit,
  ) {
    emit(state.copyWith(searchTerm: () => null));

    //filter
    add(CharacterSearched(searchTerm: ''));
  }
}
