class ProductModel{
  final int id;
  final String title;
  final double price;
  final String discription;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id, 
    required this.title, 
    required this.price, 
    required this.discription, 
    required this.image,
    required this.rating
  });

  factory ProductModel.fromJson(jsonData){
    return ProductModel(
      id: jsonData['id'], 
      title: jsonData['title'], 
      price: (jsonData['price'] as num).toDouble(), 
      discription: jsonData['description'], 
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating'])
    );
  }

}

class RatingModel{
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData){
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(), 
      count: jsonData['count']
    );
  }
}