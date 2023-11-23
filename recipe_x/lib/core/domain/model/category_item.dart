class CategoryItem {
  final int? id;
  final String title;
  final String image;

  CategoryItem({this.id, required this.title, required this.image});
}

var categoryItemsDemo = [
  CategoryItem(
    title: "Rau quả",
    image: "assets/images/categories_images/fruit.png",
  ),
  CategoryItem(
    title: "Thịt cá trứng đậu",
    image: "assets/images/categories_images/meat.png",
  ),
  CategoryItem(
    title: "Các loại bánh",
    image: "assets/images/categories_images/bakery.png",
  ),
  CategoryItem(
    title: "Sữa & đồ uống",
    image: "assets/images/categories_images/dairy.png",
  ),
];
