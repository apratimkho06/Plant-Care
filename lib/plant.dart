class Plant {
  String commonName;
  String scientificName;
  String status;
  String description;
  int nextWatering;
  String image;
  List<PlantCare> plantCare;

  Plant(
    this.commonName,
    this.scientificName,
    this.status,
    this.description,
    this.plantCare,
    this.nextWatering,
    this.image,
  );

  static List<Plant> plants = [
    Plant(
      'Cactus',
      'Euphorbia Eritrea',
      'Healthy',
      'Euphorbia eritrea is a succulent \'cactus\' house plant which is also known as Candelabrum. This handsome plant is not strictly a cactus but is similarly easy to keep.',
      [
        PlantCare(icon: 'assets/icons/water.svg', description: 'Every 3 weeks'),
        PlantCare(icon: 'assets/icons/sun.svg', description: 'Natural light'),
        PlantCare(
            icon: 'assets/icons/thermometer.svg', description: 'Minimum of 7°C')
      ],
      8,
      'assets/images/cactus.jpg',
    ),
    Plant(
      'Wild Banana',
      'Strelitzia nicolai',
      'Warning',
      'Strelitzia nicolai, commonly known as the giant white bird of paradise or wild banana, is a species of banana-like plants with erect woody stems reaching a height of 6 m, and the clumps formed can spread as far as 3.5 m.',
      [
        PlantCare(icon: 'assets/icons/water.svg', description: 'Every 8 weeks'),
        PlantCare(icon: 'assets/icons/sun.svg', description: 'Natural light'),
        PlantCare(
            icon: 'assets/icons/thermometer.svg',
            description: 'Minimum of 7°C'),
      ],
      3,
      'assets/images/wild_banana.jpg',
    ),
//    Plant(
//      'Luna',
//      'Aloe Vera',
//      'Healthy',
//      'Aloe vera is a succulent plant species of the genus Aloe. An evergreen perennial, it originates from the Arabian Peninsula, but grows wild in tropical, semi-tropical, and arid climates around the world. It is cultivated for agricultural and medicinal uses.',
//      [
//        PlantCare(icon: 'assets/icons/water.svg', description: 'Every 8 weeks'),
//        PlantCare(icon: 'assets/icons/sun.svg', description: 'Natural light'),
//        PlantCare(
//            icon: 'assets/icons/thermometer.svg',
//            description: 'Minimum of 7°C'),
//      ],
//      5,
//      'assets/images/aloe_vera.jpg',
//    ),
  ];
}

class PlantCare {
  String icon;
  String description;

  PlantCare({this.icon, this.description});
}
