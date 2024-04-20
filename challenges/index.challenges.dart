import 'dart:io';
import 'dart:math' as math;

//Descripción: Solicita al usuario un número y eleva este número al cuadrado solo si es positivo.

class Challenge1 {
  void Run() {
    double numero = obtenerNumeroPositivo();
    if (numero > 0) {
      num resultadoNum = math.pow(numero, 2);
      double resultadoDouble = resultadoNum.toDouble();
      print("El cuadrado de $numero es: $resultadoDouble");
    } else {
      
      print("El número ingresado no es positivo.");
    }
  }

  double obtenerNumeroPositivo() {
    double numero;
    while (true) {
      stdout.write("Ingresa un número: ");
      String? input = stdin.readLineSync();
      if (input != null) {
        try {
          numero = double.parse(input);
          break; // Salir del bucle si se ingresó un número válido
        } catch (e) {
          print("Error: Ingresa un número válido.");
        }
      }
    }
    return numero;
  }
} // FIN Challenge1

//Descripción: Solicita al usuario dos números. Si el primero es mayor, devuelva
//su doble, de lo contrario devuelva el triple del segundo.

class Challenge2 {
  void Run() {
    double? num1, num2;
    double resultado;

    print("Ingrese el primer número:");
    String? input1 = stdin.readLineSync();
    if (input1 != null) {
      num1 = double.tryParse(input1);
      if (num1 == null) {
        print("Por favor, ingrese un número válido.");
        return;
      }
    }

    print("Ingrese el segundo número:");
    String? input2 = stdin.readLineSync();
    if (input2 != null) {
      num2 = double.tryParse(input2);
      if (num2 == null) {
        print("Por favor, ingrese un número válido.");
        return;
      }
    }

    if (num1 != null && num2 != null) {
      if (num1 > num2) {
        resultado = num1 * 2;
      } else {
        resultado = num2 * 3;
      }

      print("El resultado es: $resultado");
    } else {
      print("No se ingresaron números válidos.");
    }
  }
} // FIN Challenge2

//Descripción: Pide al usuario un número. Si es positivo, devuelve su raíz
//cuadrada, de lo contrario, devuelve su cuadrado.

class Challenge3 {
  void Run() {
    double numero = leerNumero();
    double resultado = obtenerResultado(numero);

    if (resultado != null) {
      print("El resultado es: $resultado");
    } else {
      print("No se pudo calcular el resultado.");
    }
  }

  double leerNumero() {
    double? numero;
    String? input;

    do {
      print("Ingrese un número:");
      input = stdin.readLineSync();
      numero = double.tryParse(input ?? '');

      if (numero == null) {
        print("Por favor, ingrese un número válido.");
      }
    } while (numero == null);

    return numero;
  }

  obtenerResultado(double numero) {
    // Cambio de tipo de retorno a 'double'
    if (numero >= 0) {
      return math
          .sqrt(numero); // Devuelve la raíz cuadrada si el número es positivo
    } else {
      return math.pow(
          numero, 2); // Devuelve el cuadrado si el número es negativo
    }
  }
} // FIN Challenge3

//Descripción: Pide al usuario el radio de un círculo y calcula su perímetro.

class Challenge4 {
  void Run() {
    double radio = leerNumeroPositivo();
    double perimetro = calcularPerimetroCirculo(radio);
    print("El perímetro del círculo es: $perimetro");
  }

  double leerNumeroPositivo() {
    double numero;
    while (true) {
      print("Ingrese el radio del círculo:");
      if (double.tryParse(stdin.readLineSync() ?? '') != null) {
        numero = double.parse(stdin.readLineSync()!);
        if (numero > 0) {
          break;
        }
      }
      print("Por favor, ingrese un número positivo válido:");
    }
    return numero;
  }

  double calcularPerimetroCirculo(double radio) {
    return 2 * math.pi * radio;
  }
} //fin challenge 4

//Solicita al usuario un número entre 1 y 7 y muestra el día de la
//semana correspondiente, pero solo considerando los días laborables.
class Challenge5 {
  void Run() {
    print("Ingrese un número entre 1 y 7 (dias de la semana):");
    int numero = LeerNumeroEntre1y7();

    String diaSemana = ObtenerDiaSemana(numero);

    print(
        "El día de la semana correspondiente al número $numero es: $diaSemana");
  } // fin metodo Run

  int LeerNumeroEntre1y7() {
    int numero;
    while (true) {
      String? input = stdin.readLineSync();
      if (input != null) {
        numero = int.tryParse(input) ?? 0;
        if (numero >= 1 && numero <= 7) {
          break;
        }
      }
      print("Por favor, ingrese un número entre 1 y 7:");
    }
    return numero;
  }

  String ObtenerDiaSemana(int numero) {
    switch (numero) {
      case 1:
        return "Lunes";
      case 2:
        return "Martes";
      case 3:
        return "Miércoles";
      case 4:
        return "Jueves";
      case 5:
        return "Viernes";
      default:
        return "No es un día laborable";
    }
  }
} // fin  Challenge5

//Solicita al usuario su salario anual y, si este excede los 12000,
//muestra el impuesto a pagar que es el 15% del excedente.

class Challenge6 {
  void Run() {
    print("Por favor, ingresa tu salario: ");
    double salario = double.parse(stdin.readLineSync()!);

    if (salario > 12000) {
      double excedente = salario - 12000;
      double impuesto = excedente * 0.10;
      print("El impuesto a pagar es: $impuesto");
    }
  }
} //fin challenge6

//Solicita dos números y muestra el residuo de la división del primero entre el segundo.
class Challenge7 {
  void Run() {
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
  }
} // Fin challenge7

//Calcula y muestra la suma de los números pares entre 1 y 50.

class Challenge8 {
  void Run() {
    int sumaPares = calcularSumaPares();
    print("La suma de los números pares entre 1 y 50 es: $sumaPares");
  }

  int calcularSumaPares() {
    int suma = 0;
    for (int i = 2; i <= 50; i += 2) {
      suma += i;
    }
    return suma;
  }
} //  Fin challenge8

//Solicita al usuario los valores para dos fracciones y muestra la diferencia entre esas fracciones.
class Challenge9 {
  void Run() {
    int numerador1 = leerNumero("Ingrese el numerador de la primera fracción:");
    int denominador1 =
        leerDenominador("Ingrese el denominador de la primera fracción:");
    int numerador2 = leerNumero("Ingrese el numerador de la segunda fracción:");
    int denominador2 =
        leerDenominador("Ingrese el denominador de la segunda fracción:");

    double diferencia =
        calcularDiferencia(numerador1, denominador1, numerador2, denominador2);

    print(
        "La diferencia entre las fracciones $numerador1/$denominador1 y $numerador2/$denominador2 es: $diferencia");
  }

  int leerNumero(String mensaje) {
    int numero;
    while (true) {
      stdout.write("$mensaje ");
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        if (int.tryParse(input) != null) {
          numero = int.parse(input);
          break;
        }
      }
      print("Por favor, ingrese un número válido.");
    }
    return numero;
  }

  int leerDenominador(String mensaje) {
    int denominador;
    while (true) {
      denominador = leerNumero(mensaje);
      if (denominador != 0) {
        break;
      } else {
        print(
            "El denominador no puede ser cero. Por favor, ingrese un denominador diferente.");
      }
    }
    return denominador;
  }

  double calcularDiferencia(
      int numerador1, int denominador1, int numerador2, int denominador2) {
    double fraccion1 = numerador1 / denominador1;
    double fraccion2 = numerador2 / denominador2;
    return fraccion1 - fraccion2;
  }
} // challenge9

//Pide una palabra al usuario y muestra la longitud de esa palabra.
class Challenge10 {
  void Run() {
    stdout.write("Ingrese una palabra: ");
    String palabra = stdin.readLineSync()!;

    int longitud = calcularLongitudPalabra(palabra);

    print("La longitud de la palabra \"$palabra\" es: $longitud");
  }

  int calcularLongitudPalabra(String palabra) {
    return palabra.length;
  }
} // challenge10

// Pide al usuario cuatro números y muestra el promedio.
class Challenge11 {
  void Run() {
    double numero1 = leerNumero("Ingrese el primer número:");
    double numero2 = leerNumero("Ingrese el segundo número:");
    double numero3 = leerNumero("Ingrese el tercer número:");
    double numero4 = leerNumero("Ingrese el cuarto número:");

    double promedio = calcularPromedio(numero1, numero2, numero3, numero4);

    print("El promedio de los números ingresados es: $promedio");
  }

  double leerNumero(String mensaje) {
    double numero;
    while (true) {
      stdout.write("$mensaje ");
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        if (double.tryParse(input) != null) {
          numero = double.parse(input);
          break;
        }
      }
      print("Por favor, ingrese un número válido.");
    }
    return numero;
  }

  double calcularPromedio(double num1, double num2, double num3, double num4) {
    return (num1 + num2 + num3 + num4) / 4;
  }
} // Challenge11

//   Pide al usuario cinco números y muestra el más pequeño.
class Challenge12 {
  void Run() {
    List<double> numeros = [];
    for (int i = 0; i < 5; i++) {
      numeros.add(leerNumero("Número ${i + 1}:"));
    }

    double menorNumero = encontrarMenorNumero(numeros);

    print("El número más pequeño es: $menorNumero");
  }

  double leerNumero(String mensaje) {
    double numero;
    while (true) {
      stdout.write("$mensaje ");
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        if (double.tryParse(input) != null) {
          numero = double.parse(input);
          break;
        }
      }
      print("Por favor, ingrese un número válido.");
    }
    return numero;
  }

  double encontrarMenorNumero(List<double> numeros) {
    double menor = numeros[0];
    for (int i = 1; i < numeros.length; i++) {
      if (numeros[i] < menor) {
        menor = numeros[i];
      }
    }
    return menor;
  }
} //fin Challenge12

//Pide una palabra al usuario y devuelve el número de vocales en  esa palabra.

class Challenge13 {
  void Run() {
    stdout.write("Ingrese una palabra: ");
    String palabra = stdin.readLineSync()!;

    int numVocales = contarVocales(palabra);

    print("El número de vocales en la palabra \"$palabra\" es: $numVocales");
  }

  int contarVocales(String palabra) {
    int contador = 0;
    for (int i = 0; i < palabra.length; i++) {
      if (esVocal(palabra[i])) {
        contador++;
      }
    }
    return contador;
  }

  bool esVocal(String letra) {
    // Convertimos la letra a minúscula para hacer las comparaciones
    letra = letra.toLowerCase();

    // Verificamos si la letra es una vocal
    return letra == 'a' ||
        letra == 'e' ||
        letra == 'i' ||
        letra == 'o' ||
        letra == 'u';
  }
} // Challenge13

// Pide un número al usuario y devuelve el factorial de ese número.
class Challenge14 {
  void Run() {
    int numero =
        leerNumeroEntero("Ingrese un número para calcular su factorial:");
    int factorial = calcularFactorial(numero);

    print("El factorial de $numero es: $factorial");
  }

  int leerNumeroEntero(String mensaje) {
    int numero;
    while (true) {
      stdout.write("$mensaje ");
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        if (int.tryParse(input) != null && int.parse(input) >= 0) {
          numero = int.parse(input);
          break;
        }
      }
      print("Por favor, ingrese un número entero no negativo.");
    }
    return numero;
  }

  int calcularFactorial(int numero) {
    if (numero == 0) {
      return 1;
    }

    int resultado = 1;
    for (int i = 1; i <= numero; i++) {
      resultado *= i;
    }
    return resultado;
  }
} // fin Challenge14

//Pide un número al usuario y verifica si está en el rango de 10 a 20 (ambos incluidos).
class Challenge15 {
  void Run() {
    int numero = leerNumeroEntero(
        "Ingrese un número para verificar si está en el rango de 10 a 20:");
    bool enRango = estaEnRango(numero, 10, 20);

    if (enRango) {
      print("El número $numero está en el rango de 10 a 20.");
    } else {
      print("El número $numero NO está en el rango de 10 a 20.");
    }
  }

  int leerNumeroEntero(String mensaje) {
    int numero;
    while (true) {
      stdout.write("$mensaje ");
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        if (int.tryParse(input) != null) {
          numero = int.parse(input);
          break;
        }
      }
      print("Por favor, ingrese un número entero válido.");
    }
    return numero;
  }

  bool estaEnRango(int numero, int limiteInferior, int limiteSuperior) {
    return numero >= limiteInferior && numero <= limiteSuperior;
  }
} //fin Challenge15
