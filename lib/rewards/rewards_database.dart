class RewardsDatabase {
  static List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];
  static List<int> costs = [
    0,
    1,
    1,
  ];
  static List<String> titles = ['Reward 1', 'Reward 2', 'Reward 3'];

  static getImages() {
    return images;
  }

  static getCosts() {
    return costs;
  }
}
