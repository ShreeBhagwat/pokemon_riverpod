class Pokemon {
  String? name;
  String? id;
  String? imageurl;
  String? xdescription;
  String? ydescription;
  String? height;
  String? category;
  String? weight;
  String? typeofpokemon;
  String? weaknesses;
  String? evolutions;
  String? abilities;
  int? hp;
  int? attack;
  int? defense;
  int? special_attack;
  int? special_defense;
  int? speed;
  int? total;
  String? male_percentage;
  String? female_percentage;
  int? genderless;
  String? cycles;
  String? egg_groups;
  String? evolvedfrom;
  String? reason;
  String? base_exp;

  Pokemon({
    this.name,
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.category,
    this.weight,
    this.typeofpokemon,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.special_attack,
    this.special_defense,
    this.speed,
    this.total,
    this.male_percentage,
    this.female_percentage,
    this.genderless,
    this.cycles,
    this.egg_groups,
    this.evolvedfrom,
    this.reason,
    this.base_exp,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    imageurl = json['imageurl'];
    xdescription = json['xdescription'];
    ydescription = json['ydescription'];
    height = json['height'];
    category = json['category'];
    weight = json['weight'];
    typeofpokemon = json['typeofpokemon'].toString();
    weaknesses = json['weaknesses'].toString();
    evolutions = json['evolutions'].toString();
    abilities = json['abilities'].toString();
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    special_attack = json['special_attack'];
    special_defense = json['special_defense'];
    speed = json['speed'];
    total = json['total'];
    male_percentage = json['male_percentage'];
    female_percentage = json['female_percentage'];
    genderless = json['genderless'];
    cycles = json['cycles'];
    egg_groups = json['egg_groups'];
    evolvedfrom = json['evolvedfrom'];
    reason = json['reason'];
    base_exp = json['base_exp'];
  }
}
