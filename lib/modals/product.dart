class Product {
  String productName;
  List<String> imageURLs;
  int price;
  double discount;
  bool isfavourite;

  Product(
      {required this.productName,
      required this.price,
      this.discount = 0,
      this.isfavourite = false,
      required this.imageURLs});
}

var dummyProducts = [
  Product(
    productName: 'Grey Shirt',
    price: 999,
    imageURLs: [
      'https://m.media-amazon.com/images/I/61HF0fmRw5L._AC_UL320_.jpg'
    ],
    discount: 10,
  ),
  Product(
    productName: 'Red Check Shirt',
    price: 1599,
    imageURLs: [
      'https://assets.myntassets.com/f_webp,dpr_1.0,q_60,w_210,c_limit,fl_progressive/assets/images/2414313/2018/3/13/11520926368526-HERENOW-Men-Red--Black-Regular-Fit-Checked-Casual-Shirt-8881520926368447-1.jpg'
    ],
    discount: 20,
  ),
  Product(
    productName: 'levis white t-shirt',
    price: 499,
    imageURLs: [
      'https://m.media-amazon.com/images/I/61JpEl-p1rL._AC_UL320_.jpg'
    ],
    discount: 0,
  ),
  Product(
    productName: 'Pink Shirt',
    price: 799,
    imageURLs: [
      'https://m.media-amazon.com/images/I/A18mwMLMdqL._AC_UL320_.jpg'
    ],
    discount: 25,
  ),
  Product(
    productName: 'levis white t-shirt',
    price: 499,
    imageURLs: [
      'https://m.media-amazon.com/images/I/61JpEl-p1rL._AC_UL320_.jpg'
    ],
    discount: 0,
  ),
  Product(
    productName: 'Pink Shirt',
    price: 799,
    imageURLs: [
      'https://m.media-amazon.com/images/I/A18mwMLMdqL._AC_UL320_.jpg'
    ],
    discount: 25,
  ),
];
