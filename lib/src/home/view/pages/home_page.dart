import 'package:bwolfmon_app/src/home/domain/entities/pokemon_entity.dart';
import 'package:bwolfmon_app/src/home/infra/home_repository.dart';
import 'package:flutter/material.dart';

import '../widgets/pokemon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonEntity> pokemons = [];
  List<PokemonEntity> pokemonsFitered = [];

  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    HomeRepository().getPokemons().then((value) {
      setState(() {
        pokemons = value;
        pokemonsFitered = value;
      });
    });

    textController.addListener(onChangedText);
  }

  void onChangedText() {
    setState(() {
      pokemonsFitered = pokemons
          .where((pokemon) => pokemon.pokemonName.contains(textController.text))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey,
                child: TextField(
                  controller: textController,
                ),
              )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
      body: pokemonsFitered.isEmpty
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: pokemonsFitered.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonsFitered[index];
                return PokemonWidget(
                  name: pokemon.pokemonName,
                  pokemonUrl: pokemon.pokemonUrl,
                );
              }),
    );
  }
}
