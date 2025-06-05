class PokemonDto {
  String? name;
  Sprites? sprites;
  int? weight;

  PokemonDto({
    this.name,
    this.sprites,
    this.weight,
  });

  PokemonDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    weight = json['weight'];
  }
}

class Sprites {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  Other? other;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }
}

class Other {
  Home? home;

  Other({
    this.home,
  });

  Other.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
  }
}

class Home {
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  Home(
      {this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  Home.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }
}
