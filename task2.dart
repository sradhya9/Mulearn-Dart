import 'dart:io';

void main() {
  stdout.write('Enter the first number: ');
  String? input1 = stdin.readLineSync();
  double number1 = double.parse(input1!);

  stdout.write('Enter the second number: ');
  String? input2 = stdin.readLineSync();
  double number2 = double.parse(input2!);

  double sum = number1 + number2;

  print("The sum of " + "$number1" + " and $number2 is $sum");
}
