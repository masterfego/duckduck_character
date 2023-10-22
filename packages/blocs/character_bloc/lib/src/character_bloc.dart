import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:character_bloc/src/loading_state.dart';
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
            selectedCharacter: null,
            filteredCharacters: [],
            searchTerm: null,
            state: LoadingState.loading,
          ),
        ) {
    on<CharacterStarted>(_onCharacterStared, transformer: restartable());
    on<CharacterSearched>(_onCharacterSearched);
    on<CharacterSearchCleared>(_onCharacterSearchCleared);
    on<CharacterSelected>(_onCharacterSelected);
  }

  Future _onCharacterStared(
    CharacterStarted event,
    Emitter<CharacterState> emit,
  ) async {
    emit(
      state.copyWith(state: LoadingState.loading),
    );

    final characters = await _repository.getCharacters();
    if (characters != null) {
      emit(
        state.copyWith(
          characters: characters,
          filteredCharacters: characters,
          state: LoadingState.completed,
        ),
      );
    } else {
      emit(
        state.copyWith(
          characters: [],
          filteredCharacters: [],
          state: LoadingState.failure,
        ),
      );
    }
  }

  void _onCharacterSearched(
    CharacterSearched event,
    Emitter<CharacterState> emit,
  ) {
    var filteredCharacters = <Character>[];
    final shoudlSearch = event.searchTerm.trim().isNotEmpty;

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

  void _onCharacterSelected(
    CharacterSelected event,
    Emitter<CharacterState> emit,
  ) {
    emit(state.copyWith(selectedCharacter: () => event.character));
  }
}
