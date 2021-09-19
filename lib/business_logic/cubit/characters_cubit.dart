import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository repository;
  late List<Character> listChar;

  CharactersCubit(this.repository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    repository.getAllCharacters().then((value) {
      emit(CharactersLoaded(value));
      listChar = value;
    });

    return listChar;
  }
}
