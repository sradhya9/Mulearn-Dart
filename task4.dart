import 'dart:io';

void main() {
  // Display the program title
  print("Multiplication Table Generator");

  // Prompt the user to input a number
  stdout.write("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);

  // Display header for the multiplication table
  print("\nMultiplication Table for $number:");

  int sum = 0; // Variable to store the sum of the results

  // Multiplication table
  for (int i = 1; i <= 10; i++) {
    int result = number * i; 
    print("$number x $i = $result"); 
    sum += result;
  }

  // Display the total sum 
  print("\nSum of the first 10 multiples of $number: $sum");
}
