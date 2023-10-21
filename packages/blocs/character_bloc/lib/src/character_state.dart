part of 'character_bloc.dart';

class CharacterState extends Equatable {
  final List<Character> characters;
  final List<Character> filteredCharacters;
  final Character? selectedCharacter;
  final String? searchTerm;

  const CharacterState({
    required this.characters,
    required this.selectedCharacter,
    required this.filteredCharacters,
    required this.searchTerm,
  });

  CharacterState copyWith({
    List<Character>? characters,
    Character? Function()? selectedCharacter,
    List<Character>? filteredCharacters,
    String? Function()? searchTerm,
  }) {
    return CharacterState(
      characters: characters ?? this.characters,
      selectedCharacter: selectedCharacter != null
          ? selectedCharacter()
          : this.selectedCharacter,
      filteredCharacters: filteredCharacters ?? this.filteredCharacters,
      searchTerm: searchTerm != null ? searchTerm() : this.searchTerm,
    );
  }

  @override
  List<Object?> get props => [
        characters,
        selectedCharacter,
        filteredCharacters,
        searchTerm,
      ];
}
