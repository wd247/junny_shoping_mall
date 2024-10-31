import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products;
  int total = 0;

  ShoppingMall(this.products);

  void showProducts() {
    for (var product in products) {
      print('${product.name} / ${product.price} 달러');
    }
  }

  void addToCart() {
    print('장바구니에 담을 상품의 이름을 입력해주세요:');
    String? productName = stdin.readLineSync()?.trim();

    var product = products.firstWhere((p) => p.name == productName,
        orElse: () => Product('', 0));

    if (product.name.isEmpty) {
      print('입력값이 올바르지 않아요!');
      return;
    }

    print('장바구니에 담을 상품의 개수를 입력해주세요:');
    String? countInput = stdin.readLineSync();

    try {
      int count = int.parse(countInput!);
      if (count <= 0) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요!');
        return;
      }

      total += product.price * count;
      print('장바구니에 상품이 담겼어요!');
    } catch (e) {
      print('입력값이 올바르지 않아요!');
    }
  }

  void showTotal() {
    print('장바구니에 $total달러 어치를 담으셨네요!');
  }
}

void main() {
  var shoppingMall = ShoppingMall([
    Product('BTC', 72000),
    Product('ETH', 2600),
    Product('BNB', 582),
    Product('BCH', 373),
    Product('SOL', 173),
  ]);

  bool isRunning = true;

  while (isRunning) {
    print('-' * 85);
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니 총액 보기 / [4] 프로그램 종료');
    print('-' * 85);

    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        shoppingMall.showProducts();
        break;
      case '2':
        shoppingMall.addToCart();
        break;
      case '3':
        shoppingMall.showTotal();
        break;
      case '4':
        print('정말 종료하시겠습니까? [5] 종료 / 다른 키 입력 시 취소');
        String? confirmExit = stdin.readLineSync();
        if (confirmExit == '5') {
          print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
          isRunning = false;
        } else {
          print('종료하지 않습니다.');
        }
        break;
      default:
        print('지원하지 않는 기능입니다! 다시 시도해 주세요 ..');
    }
  }
}
