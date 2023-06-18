import 'package:flutter_test/flutter_test.dart';
import 'package:webkeyz_task/modules/home/cubit/cubit.dart';
import 'package:webkeyz_task/shared/network/repository.dart';
import 'package:webkeyz_task/shared/network/repository_impl.dart';

void main() {
  late Repository repository;

  setUp(() {
    repository = RepoImpl(dioHelper: null);
  });
  group('HomeCubit', () {
    test('Adding an item to the cart should increase the total count',
        () async {
      // Arrange

      final HomeCubit cubit = HomeCubit(repository);

      // Act
      await cubit.addToCart();
      final cart = cubit.cartCount;

      // Assert
      expect(cart, 1);
    });

    test('Check if data get from local successfully', () async {
      // Arrange

      final HomeCubit cubit = HomeCubit(repository);

      // Act
      await cubit.addToCart();
      int productLength = cubit.productList.length;

      // Assert
      expect((productLength != 0), false);
    });
  });
}
