import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/widgets/card_manager.dart';

void main() {
  group('CartManager', () {
    late CartManager cart;

    setUp(() {
      cart = CartManager();
    });

    test('adds new item to cart', () {
      cart.addItem('1', 'iPhone', 1000.0);
      expect(cart.items.length, 1);
      expect(cart.items.first.name, 'iPhone');
      expect(cart.items.first.quantity, 1);
    });

    test('adds duplicate item and increases quantity', () {
      cart.addItem('1', 'iPhone', 1000.0);
      cart.addItem('1', 'iPhone', 1000.0);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 2);
    });

    test('removes item from cart', () {
      cart.addItem('1', 'iPhone', 1000.0);
      cart.removeItem('1');
      expect(cart.items.isEmpty, true);
    });

    test('updates item quantity', () {
      cart.addItem('1', 'iPhone', 1000.0);
      cart.updateQuantity('1', 5);
      expect(cart.items.first.quantity, 5);
    });

    test('removes item if quantity updated to zero', () {
      cart.addItem('1', 'iPhone', 1000.0);
      cart.updateQuantity('1', 0);
      expect(cart.items.isEmpty, true);
    });

    test('calculates subtotal correctly', () {
      cart.addItem('1', 'iPhone', 1000.0);
      cart.addItem('2', 'Galaxy', 800.0);
      expect(cart.subtotal, 1800.0);
    });

    test('calculates total discount correctly', () {
      cart.addItem('1', 'iPhone', 1000.0, discount: 0.1); // 10%
      cart.addItem('2', 'Galaxy', 800.0, discount: 0.25); // 25%
      expect(cart.totalDiscount, 100.0 + 200.0); // 300.0
    });

    test('calculates total amount after discount', () {
      cart.addItem('1', 'iPhone', 1000.0, discount: 0.1); // 900
      cart.addItem('2', 'Galaxy', 800.0, discount: 0.25); // 600
      expect(cart.totalAmount, 1500.0);
    });

    test('clears cart', () {
      cart.addItem('1', 'iPhone', 1000.0);
      cart.clearCart();
      expect(cart.items.isEmpty, true);
    });

    test('calculates total items correctly', () {
      cart.addItem('1', 'iPhone', 1000.0);
      cart.addItem('1', 'iPhone', 1000.0);
      cart.addItem('2', 'Galaxy', 800.0);
      expect(cart.totalItems, 3);
    });
  });
}
