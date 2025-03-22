// Simple car buying and selling platform using Dart OOPs

class Car {
  String name;
  double price;

  Car(this.name, this.price);

  void changePrice(double newPrice) {
    price = newPrice;
  }
}

class Person {
  String name;
  List<Car> ownedCars;
  double moneyLeft;

  Person(this.name, this.moneyLeft) : ownedCars = []; // : ownedCars = [] initializes an empty list , right before the construction of the class, first

  void buyCar(Car car) {
    if (moneyLeft >= car.price) {
      ownedCars.add(car);
      moneyLeft -= car.price;
      print('$name bought ${car.name} for \$${car.price}.');
    } else {
      print('$name does not have enough money to buy ${car.name}.');
    }
  }

  void sellCar(Car car) {
    if (ownedCars.contains(car)) {
      ownedCars.remove(car);
      moneyLeft += car.price;
      print('$name sold ${car.name} for \$${car.price}.');
    } else {
      print('$name does not own ${car.name} and cannot sell it.');
    }
  }
}

void main() {
  Car car1 = Car('Tesla Model S', 80000);
  Car car2 = Car('BMW 3 Series', 40000);

  Person amal = Person('Amal', 100000);

  amal.buyCar(car1);
  amal.buyCar(car2);
  amal.sellCar(car1);

  car2.changePrice(35000);
  print('New price of ${car2.name} is  \$${car2.price}.');
}
