import 'dart:io';

void main() {
  print("Digite el primer numero");
  double? a = double.tryParse(stdin.readLineSync()!);

  print("Digite el segundo numero");
  double? b = double.tryParse(stdin.readLineSync()!);

  const indeterminado = "INDETERMINADO";

  if (a != null && b != null) {
    print(
        "SUMA : ${a + b}, RESTA : ${a - b}, MULTIPLICACION : ${a * b}, DIVISION : ${(b != 0 ? a / b : indeterminado)}");
  } else {
    print("registros numeros ingresados NO válidos");
  }
}// fin principal

