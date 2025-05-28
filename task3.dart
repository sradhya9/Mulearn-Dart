import 'dart:io';

/// Entry point of the program
void main() {
  print("Welcome to Dart Calculator!\n");

  bool continueProgram = true;

  while (continueProgram) {
    // Displaying the menu options
    print("Select an operation:");
    print("1. Addition");
    print("2. Subtraction");
    print("3. Multiplication");
    print("4. Division");
    print("5. Check Equality");
    print("6. Greater Number");
    print("7. Exit");

    stdout.write("Enter your choice (1-7): ");
    String? choiceInput = stdin.readLineSync();
    int choice = int.tryParse(choiceInput!) ?? 0;

    // If user chooses to exit
    if (choice == 7) {
      print("Thank you for using Dart Calculator. Goodbye!");
      continueProgram = false;
      break;
    }

    // Prompt for two numbers for all operations except exit
    stdout.write("Enter the first number: ");
    double num1 = double.parse(stdin.readLineSync()!);

    stdout.write("Enter the second number: ");
    double num2 = double.parse(stdin.readLineSync()!);

    // Perform the selected operation
    switch (choice) {
      case 1:
        print("Result: $num1 + $num2 = ${num1 + num2}\n");
        break;
      case 2:
        print("Result: $num1 - $num2 = ${num1 - num2}\n");
        break;
      case 3:
        print("Result: $num1 * $num2 = ${num1 * num2}\n");
        break;
      case 4:
        if (num2 == 0) {
          print("Error: Division by zero is not allowed.\n");
        } else {
          print("Result: $num1 / $num2 = ${num1 / num2}\n");
        }
        break;
      case 5:
        if (num1 == num2) {
          print("Result: $num1 is equal to $num2\n");
        } else {
          print("Result: $num1 is not equal to $num2\n");
        }
        break;
      case 6:
        if (num1 > num2) {
          print("Result: $num1 is greater than $num2\n");
        } else if (num2 > num1) {
          print("Result: $num2 is greater than $num1\n");
        } else {
          print("Result: Both numbers are equal\n");
        }
        break;
      default:
        print("Invalid choice. Please enter a number from 1 to 7.\n");
    }
  }
}
