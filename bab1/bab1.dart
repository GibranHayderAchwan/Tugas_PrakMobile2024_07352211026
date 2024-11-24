class Member {
  String username;
  int yearsOld;
  late List<Goods> inventory;
  MemberType? type;

  Member(this.username, this.yearsOld, this.type) {
    inventory = [];
  }
}

class Goods {
  String title;
  double value;
  bool isAvailable;

  Goods(this.title, this.value, this.isAvailable);
}

enum MemberType { Manager, Buyer }

class Manager extends Member {
  Manager(String username, int yearsOld) : super(username, yearsOld, MemberType.Manager);

  void addGoods(Goods goods) {
    if (goods.isAvailable) {
      inventory.add(goods);
      print("\n===== GOODS ADDITION REPORT =====");
      print('${goods.title} successfully added to inventory.');
    } else {
      print('${goods.title} is out of stock and cannot be added.');
    }
  }

  void deleteGoods(Goods goods) {
    inventory.remove(goods);
    print("\n===== GOODS REMOVAL REPORT =====");
    print('${goods.title} successfully removed from inventory.');
  }
}

class Buyer extends Member {
  Buyer(String username, int yearsOld) : super(username, yearsOld, MemberType.Buyer);

  void browseGoods() {
    print('\nAvailable Goods:');
    for (var goods in inventory) {
      print('${goods.title} - Rp${goods.value} - ${goods.isAvailable ? "In Stock" : "Out of Stock"}');
    }
  }
}

Future<void> retrieveGoodsData() async {
  print('Retrieving goods data...');
  await Future.delayed(Duration(seconds: 2));
  print('Goods data successfully retrieved.');
}

void main() {
  Manager manager = Manager('Gibran', 22);
  Buyer buyer = Buyer('Bun', 20);

  Goods goods1 = Goods('Tablet', 10000000.0, true);
  Goods goods2 = Goods('Smartwatch', 5000000.0, false);
  Goods goods3 = Goods('Desktop PC', 20000000.0, true);

  try {
    manager.addGoods(goods1);
    manager.deleteGoods(goods2);
    manager.addGoods(goods3);
  } catch (e) {
    print('Error: $e');
  }

  buyer.browseGoods();


  retrieveGoodsData();

 
  Map<String, Goods> goodsDirectory = {
    goods1.title: goods1,
    goods2.title: goods2,
    goods3.title: goods3,
  };

  goodsDirectory.forEach((key, value) {
    print('${key} - Price: Rp${value.value} - Stock: ${value.isAvailable ? "Available" : "Out of Stock"}');
  });

  Set<Goods> goodsSet = {goods1, goods2, goods3};
  print('\nGoods List from Set:');
  goodsSet.forEach((goods) {
    print('${goods.title} - Price: Rp${goods.value} - Stock: ${goods.isAvailable ? "Available" : "Out of Stock"}');
  });
}
