import 'dart:io';
import 'dart:math';

void main() {
  Circulo circ = Circulo();

  circ.radio = 20;
  var resultado_area = circ.Area();
  var resultado_perimetro = circ.Perimetro();

  print("el area es es: ${resultado_area}");
  print("el perimetro  es :${resultado_perimetro} ");
  print("el nuevo radio es:  ${circ.Add10()}");

  int prev = 0, next = 1, suma;
  for (int i = 0; i < 10; i++) {
    print(prev);
    suma = prev + next;
    prev = next;
    next = suma;
  }

//excepciones

  try {
    print("numero a dividir");
    double num = double.parse(stdin.readLineSync()!);
    print("numero divisor");
    double div = double.parse(stdin.readLineSync()!);
    if (div == 0) {
      throw ArgumentError("no se puede dividir por cero ");
    }

    print("el resultado  es: ${num / div} ");
  } on ArgumentError catch (e) {
    print(e.message);
  } catch (e) {
    print("Error ");
  }
} // fin principal

abstract class ExtraCalculations {
  double Add10();
}

abstract class Figura {
  double Area();
  double Perimetro();
}

class Circulo implements Figura, ExtraCalculations {
  double? radio;

  @override
  double Area() => pi * radio! * radio!;

  @override
  double Perimetro() => 2 * pi * radio!;

  @override
  double Add10() {
    return radio! + 10;
  }
}
