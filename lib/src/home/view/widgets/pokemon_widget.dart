import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  final String name;
  final String pokemonUrl;

  const PokemonWidget(
      {super.key, required this.name, required this.pokemonUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(pokemonUrl),
      ),
      title: Text(name),
    );
  }
}
