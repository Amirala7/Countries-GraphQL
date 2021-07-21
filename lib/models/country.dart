class Country {
  Country({
    required this.name,
    required this.capital,
    required this.population,
  });

  // constructing the data model from a map
  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: (map['name'] as String?) ?? '',
      capital: (map['capital']?['name'] as String?) ?? '',
      population:
          _formatPopulation((map['population'] as int?)?.toString() ?? ''),
    );
  }

  //Formating the population from int to a decimated string
  static String _formatPopulation(String population) {
    return population.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');
  }

  final String name;
  final String capital;
  final String population;
}
