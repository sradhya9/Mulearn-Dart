void main() {
  List<int> numbers1 = [1, 2, 3, 4, 5];  // First list of numbers
  List<int> numbers2 = [10, 20, 30];     // Second list of numbers

  print("\nList 1");
  for (var n in numbers1) {  //Display List1
    print("$n");    
  }

  print("\nList 2");
  for (var n in numbers2) {  //Display List2
    print("$n");    
  }

  print("\nDouble numbers in List1:");
  processList(numbers1, (n) => n * 2);   // Double each number in numbers1

  print("\nSquare numbers in List1:");
  processList(numbers1, (n) => n * n);   // Square each number in numbers1

  print("\nTriple numbers in List2:");
  processList(numbers2, (n) => n * 3);   // Triple each number in numbers2

  print("\nSubtract 1 in List2:");
  processList(numbers2, (n) => n - 1);   // Subtract 1 from each number in numbers2
}

void processList(List<int> numbers, int Function(int) operation) {
  for (var n in numbers) {
    int result = operation(n); // Apply operation to the current element
    print("$n -> $result");    // Print original number and result
  }
}
