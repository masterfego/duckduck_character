part of 'character_bloc.dart';

class CharacterState extends Equatable {
  final List<Character> characters;
  final List<Character> filteredCharacters;
  final String? searchTerm;

  const CharacterState({
    required this.characters,
    required this.filteredCharacters,
    this.searchTerm,
  });

  CharacterState copyWith({
    List<Character>? characters,
    List<Character>? filteredCharacters,
    String? Function()? searchTerm,
  }) {
    return CharacterState(
      characters: characters ?? this.characters,
      filteredCharacters: filteredCharacters ?? this.filteredCharacters,
      searchTerm: searchTerm != null ? searchTerm() : this.searchTerm,
    );
  }

  @override
  List<Object?> get props => [characters, filteredCharacters, searchTerm];
}
