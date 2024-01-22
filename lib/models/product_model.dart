// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String name;
  int totalCount;
  String price;

  Product({
    required this.name,
    required this.totalCount,
    required this.price,
  });

  int totalAmount(String price) {
    return totalCount * int.parse(price);
  }
}
