import 'package:poke_dex/models/flavor_text_entries_model.dart';
import 'package:poke_dex/models/genera_model.dart';
import 'package:poke_dex/models/pal_park_encounters.dart';
import 'package:poke_dex/models/pokedex_numbers_model.dart';
import 'package:poke_dex/models/varietes_model.dart';

import 'evolution_chain_model.dart';
import 'names_model.dart';
import 'obj_pokemon_model.dart';

class SpecieModel {
  final int? baseHappiness;
  final int? captureRate;
  final ObjPokemon? color;
  final EvolutionChain? evolutionChain;
  final ObjPokemon? evolvesFromSpecies;
  final List<FlavorTextEntriesModel>? flavorTextEntries;
  final bool? formsSwitchable;
  final int? genderRate;
  final List<GeneraModel>? genera;
  final ObjPokemon? generation;
  final ObjPokemon? growthRate;
  final ObjPokemon? habitat;
  final bool? hasGenderDifferences;
  final int? hatchCounter;
  final int? id;
  final bool? isBaby;
  final String? name;
  final List<Names>? names;
  final int? order;
  final List<PalParkEncounters>? palParkEncounters;
  final List<PokedexNumbers>? pokedexNumbers;
  final ObjPokemon? shape;
  final List<VarietiesModel>? varieties;

  SpecieModel({
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formsSwitchable,
    this.genderRate,
    this.genera,
    this.generation,
    this.growthRate,
    this.habitat,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.name,
    this.names,
    this.order,
    this.palParkEncounters,
    this.pokedexNumbers,
    this.shape,
    this.varieties,
  });

  SpecieModel.fromJson(Map<String, dynamic> json)
      : baseHappiness = json['base_happiness'],
        captureRate = json['capture_rate'],
        color =
            json['color'] != null ? ObjPokemon.fromJson(json['color']) : null,
        evolutionChain = json['evolution_chain'] != null
            ? EvolutionChain.fromJson(json['evolution_chain'])
            : null,
        evolvesFromSpecies = json['evolves_from_species'] != null
            ? ObjPokemon.fromJson(json['evolves_from_species'])
            : null,
        flavorTextEntries = <FlavorTextEntriesModel>[],
        formsSwitchable = json['forms_switchable'],
        genderRate = json['gender_rate'],
        genera = <GeneraModel>[],
        generation = json['generation'] != null
            ? ObjPokemon.fromJson(json['generation'])
            : null,
        growthRate = json['growth_rate'] != null
            ? ObjPokemon.fromJson(json['growth_rate'])
            : null,
        habitat = json['habitat'] != null
            ? ObjPokemon.fromJson(json['habitat'])
            : null,
        hasGenderDifferences = json['has_gender_differences'],
        hatchCounter = json['hatch_counter'],
        id = json['id'],
        isBaby = json['is_baby'],
        name = json['name'],
        names = <Names>[],
        order = json['order'],
        palParkEncounters = <PalParkEncounters>[],
        pokedexNumbers = <PokedexNumbers>[],
        shape =
            json['shape'] != null ? ObjPokemon.fromJson(json['shape']) : null,
        varieties = <VarietiesModel>[] {
    if (json['flavor_text_entries'] != null) {
      json['flavor_text_entries'].forEach((flavorTextEntry) {
        flavorTextEntries!
            .add(FlavorTextEntriesModel.fromJson(flavorTextEntry));
      });
    }

    if (json['genera'] != null) {
      json['genera'].forEach((generaModel) {
        genera!.add(GeneraModel.fromJson(generaModel));
      });
    }

    if (json['names'] != null) {
      json['names'].forEach((name) {
        names!.add(Names.fromJson(name));
      });
    }

    if (json['pal_park_encounters'] != null) {
      json['pal_park_encounters'].forEach((plaParkEncounter) {
        palParkEncounters!.add(PalParkEncounters.fromJson(plaParkEncounter));
      });
    }

    if (json['pokedex_numbers'] != null) {
      json['pokedex_numbers'].forEach((pokedexNumber) {
        pokedexNumbers!.add(PokedexNumbers.fromJson(pokedexNumber));
      });
    }

    if (json['varieties'] != null) {
      json['varieties'].forEach((variety) {
        varieties!.add(VarietiesModel.fromJson(variety));
      });
    }
  }
}
