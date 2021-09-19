import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharacterWebServices webServices;

  CharactersRepository(this.webServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await webServices.getAllCharacters();
    return characters.map((char) => Character.fromJson(char)).toList();
  }
}
