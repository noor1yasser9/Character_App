import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';
import 'constants/strings.dart';
import 'presentation/screens/characters_screen.dart';
import 'presentation/screens/characters_details_screen.dart';
import 'business_logic/cubit/characters_cubit.dart';
import 'data/repository/characters_repository.dart';
import 'data/web_services/characters_web_services.dart';


class AppRouter {
  late CharactersRepository repository;
  late CharactersCubit cubit;

  AppRouter() {
    repository = CharactersRepository(CharacterWebServices());
    cubit = CharactersCubit(repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => cubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => cubit,
            child: CharactersDetailsScreen(),
          ),
        );
    }
  }
}
