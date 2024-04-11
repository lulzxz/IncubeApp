class Items {
  final String img;
  final String title;
  final String subTitle;

  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
      img: 'assets/1.png',
      title: 'Incube',
      subTitle: "Let's Learn About Incube"),
  Items(
      img: 'assets/2.png',
      title:
          'inCube is a smart incubator that helps\nranchers to hatch their eggs anywhere\nand anytime.',
      subTitle: ''),
  Items(
      img: 'assets/3.png',
      title:
          'with Features like Internet of Things (IoT),\nRealtime Dashboard, Report and Notification,\n inCube will helps you handle your jobs easier.',
      subTitle: ''),
  Items(
      img: 'assets/4.png',
      title:
          "Let's start and join inCube today, in order to\n making the world a better, more exciting place",
      subTitle: "")
];
