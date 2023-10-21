import 'package:character_api/character_api.dart';
import 'package:character_repository/character_repository.dart';
import 'package:character_repository/src/conversion/character_conversion.dart';

class CharacterRepository {
  final CharacterApiClient _apiClient;

  CharacterRepository({
    required CharacterApiClient apiClient,
  }) : _apiClient = apiClient;

  Future<List<Character>?> getCharacters() async {
    final result = await _apiClient.getCharaters();

    if (result != null) {
      final conversionResult = result.getCharacterModels();
      return conversionResult;
    }

    return null;
  }
}
