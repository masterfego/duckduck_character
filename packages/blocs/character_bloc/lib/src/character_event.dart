part of 'character_bloc.dart';

sealed class CharacterEvent {}

class CharacterStarted extends CharacterEvent {}

class CharacterSearched extends CharacterEvent {
  final String searchTerm;

  CharacterSearched({
    required this.searchTerm,
  });
}

class CharacterSearchCleared extends CharacterEvent {}
