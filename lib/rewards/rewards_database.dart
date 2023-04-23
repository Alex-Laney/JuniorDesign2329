class RewardsDatabase {
  static List<String> images = [
    'assets/images/bachbear.png',
    'assets/images/bachboxing.png',
    'assets/images/beethovenarchitect.png',
    'assets/images/beethovensmartphone.png',
    'assets/images/beethovensunglasses.png',
    'assets/images/mozartdj.png',
    'assets/images/mozartdunking.png',
    'assets/images/mozartsuperman.png',
  ];
  static List<int> costs = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ];
  static List<String> titles = [
    'Bach Riding a Bear',
    'Bach Boxing',
    'Beethoven as an Architect',
    'Beethoven with a Smartphone',
    'Beethoven in Sunglasses',
    'Mozart as a DJ',
    'Mozart Dunking',
    'Mozart as Superman',
  ];

  static getImages() {
    return images;
  }

  static getCosts() {
    return costs;
  }
}
