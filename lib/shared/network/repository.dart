import 'package:dartz/dartz.dart';
import 'package:webkeyz_task/models/response/product_model.dart';

abstract class Repository {
  Future<Either<dynamic, List<ProductModel>>> getProducts();
}
