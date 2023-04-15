import 'package:goodwill/gen/assets.gen.dart';

class Category {
  String icon;
  String title;
  double rating;
  int quantity;
  String path;
  Category(
      {required this.icon,
      required this.title,
      this.quantity = 0,
      this.rating = 0.0,
      required this.path});

  Category copyWith(
      {String? icon,
      String? title,
      double? rating,
      int? quantity,
      String? path}) {
    return Category(
        icon: icon ?? this.icon,
        title: title ?? this.title,
        path: path ?? this.path,
        rating: rating ?? this.rating,
        quantity: quantity ?? this.quantity);
  }
}

List<Category> listCategories = [
  Category(
      icon: 'assets/svgs/casual-t-shirt-.svg',
      title: 'Clothes',
      path: Assets.images.homePage.item.path),
  Category(
      icon: 'assets/svgs/sport-shoe.svg',
      title: 'Shoes',
      path: Assets.images.homePage.item.path),
  Category(
      icon: 'assets/svgs/bag.svg',
      title: 'Bags',
      path: Assets.images.homePage.item.path),
  Category(
      icon: 'assets/svgs/electronic-devices.svg',
      title: 'Electronics',
      path: Assets.images.homePage.item.path),
  Category(
      icon: 'assets/svgs/hand-watch.svg',
      title: 'Watch',
      path: Assets.images.homePage.item.path),
  Category(
      icon: 'assets/svgs/necklace.svg',
      title: 'Jewelry',
      path: Assets.images.homePage.item.path),
  Category(
      icon: 'assets/svgs/cooking.svg',
      title: 'Kitchen',
      path: Assets.images.homePage.item.path),
  Category(
      icon: 'assets/svgs/sister-and-brother.svg',
      title: 'Toys',
      path: Assets.images.homePage.item.path),
];
