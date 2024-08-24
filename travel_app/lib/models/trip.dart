// ignore_for_file: constant_identifier_names, non_constant_identifier_names

enum Season {
  Winter,
  Spring,
  Summer,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activites,
  Therapy,
}

class Trip {
  final String id;
  final List<String> Categoties;
  final String title;
  final String imageUrl;
  final List<String> activites;
  final List<String> program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Trip({
    required this.id,
    required this.Categoties,
    required this.title,
    required this.imageUrl,
    required this.activites,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });
}
