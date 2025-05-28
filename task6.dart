import 'dart:io';

// Class car with name and price
class Car {
  String name;
  double price;

  Car(this.name, this.price);

  // Chanr price
  void changePrice(double newPrice) {
    price = newPrice;
  }

  @override
  String toString() => "$name (\$${price.toStringAsFixed(2)})";
}

// Class person who can buy/sell cars
class Person {
  String name;
  List<Car> ownedCars = []; // List of cars currently owned
  double moneyLeft;

  Person(this.name, this.moneyLeft);

  // Method to buy a car 
  void buyCar(Car car) {
    if (moneyLeft >= car.price) {
      ownedCars.add(car);
      moneyLeft -= car.price;
      print("$name bought ${car.name} for \$${car.price}");
    } else {
      print("$name does not have enough money to buy ${car.name}");
    }
  }

  // Method to sell a car 
  void sellCar(Car car) {
    if (ownedCars.contains(car)) {
      ownedCars.remove(car);
      moneyLeft += car.price;
      print("$name sold ${car.name} for \$${car.price}");
    } else {
      print("$name does not own ${car.name}");
    }
  }

  // Method to display owned cars
  void showStatus() {
    print("\n$name owns the following cars:");
    if (ownedCars.isEmpty) {
      print("None");
    } else {
      for (var car in ownedCars) {
        print("- ${car.name} (\$${car.price})");
      }
    }
    print("Money left: \$${moneyLeft.toStringAsFixed(2)}\n");
  }
}

void main() {
  // Sample cars available for purchase
  List<Car> availableCars = [
    Car("Toyota Corolla", 15000),
    Car("Honda Civic", 18000),
    Car("Ford Mustang", 30000),
  ];

  // Creating a person
  Person person = Person("Alex", 40000);

  // Start of the menu-driven interface
  while (true) {
    // Displaying menu options
    print("\nMenu");
    print("1. View available cars");
    print("2. Buy a car");
    print("3. Sell a car");
    print("4. View status");
    print("5. Change price of a car");
    print("6. Exit");
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      // Display available cars
      case '1':
        print("\nAvailable Cars:");
        for (int i = 0; i < availableCars.length; i++) {
          print("${i + 1}. ${availableCars[i]}");
        }
        break;

      // Buy car
      case '2':
        print("\nSelect a car to buy:");
        for (int i = 0; i < availableCars.length; i++) {
          print("${i + 1}. ${availableCars[i]}");
        }
        stdout.write("Enter car number: ");
        int index = int.parse(stdin.readLineSync()!) - 1;
        if (index >= 0 && index < availableCars.length) {
          person.buyCar(availableCars[index]);
        } else {
          print("Invalid selection.");
        }
        break;

      // Sell car
      case '3':
        print("\nOwned Cars:");
        for (int i = 0; i < person.ownedCars.length; i++) {
          print("${i + 1}. ${person.ownedCars[i]}");
        }
        stdout.write("Enter car number to sell: ");
        int index = int.parse(stdin.readLineSync()!) - 1;
        if (index >= 0 && index < person.ownedCars.length) {
          person.sellCar(person.ownedCars[index]);
        } else {
          print("Invalid selection.");
        }
        break;

      //  Display owned cars
      case '4':
        person.showStatus();
        break;

      // Update the price 
      case '5':
        print("\nSelect a car to change price:");
        for (int i = 0; i < availableCars.length; i++) {
          print("${i + 1}. ${availableCars[i]}");
        }
        stdout.write("Enter car number: ");
        int index = int.parse(stdin.readLineSync()!) - 1;
        if (index >= 0 && index < availableCars.length) {
          stdout.write("Enter new price: ");
          double newPrice = double.parse(stdin.readLineSync()!);
          availableCars[index].changePrice(newPrice);
          print("Price updated.");
        } else {
          print("Invalid selection.");
        }
        break;

      // Exit the program
      case '6':
        print("Exiting program.");
        return;

      // Handle any invalid input
      default:
        print("Invalid choice. Try again.");
    }
  }
}

