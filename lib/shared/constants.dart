import 'package:webkeyz_task/models/response/product_model.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';

class LocalData {
  static List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: 'Chocolate Lovers',
      image: Assets.images.cookie1.path,
      price: '100 USD',
      discount: '110 USD',
      description:
          'Decadent cocoa cookie with generous dark chocolate chips. Perfectly balanced for chocolate lovers.  Enjoy your cookie, anytime.',
    ),
    ProductModel(
      id: 2,
      name: 'Chocolate Lovers 2',
      image: Assets.images.image4.path,
      price: '200 USD',
      discount: '210 USD',
      description:
          'Decadent cocoa cookie with generous dark chocolate chips. Perfectly balanced for chocolate lovers.  Enjoy your cookie, anytime.',
    ),
    ProductModel(
      id: 3,
      name: 'Double Chocolate',
      image: Assets.images.cookie1.path,
      price: '300 USD',
      discount: '310 USD',
      description:
          'Decadent cocoa cookie with generous dark chocolate chips. Perfectly balanced for chocolate lovers.  Enjoy your cookie, anytime.',
    ),
  ];
}
