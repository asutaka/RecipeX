class CategoryItem {
  final int? id;
  final String name;
  final String imagePath;

  CategoryItem({this.id, required this.name, required this.imagePath});
}

var categoryItemsDemo = [
  CategoryItem(
    name: "Rau quả",
    imagePath: "assets/images/categories_images/fruit.png",
  ),
  CategoryItem(
    name: "Thịt cá trứng đậu",
    imagePath: "assets/images/categories_images/meat.png",
  ),
  CategoryItem(
    name: "Các loại bánh",
    imagePath: "assets/images/categories_images/bakery.png",
  ),
  CategoryItem(
    name: "Sữa & đồ uống",
    imagePath: "assets/images/categories_images/dairy.png",
  ),
];
