
void main() {

   cuadrado cuadr =cuadrado();
cuadr.Base=20;
cuadr.Altura=40;

  print("El area es : ${cuadr.Area}");
  print("el perimetro es : ${cuadr.Perimetro}");
   print("el lado es : ${cuadr.lado}");

}

class Rectangulo{
  double? Base;
  double? Altura;

  double get Area =>Base!*Altura!;
  double get Perimetro =>2*Base! + 2* Altura!;

}

class cuadrado extends Rectangulo{
  set lado(double value){
    Base= value;
    Altura=value;
  }
  double get lado =>Base!;
}