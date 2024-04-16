import 'dart:io';

void main() {
  print('hola, Bienvenido al programa para calcular Años');
  print('Escribe tu nombre');
  String? nameInPut = stdin.readLineSync();
  print('un Gusto conocerte  $nameInPut');
  print('Escribe tu fecha de Nacimiento en formato dd/mm/yy: ');
  String? birthdayInPut = stdin.readLineSync();
  DateTime? dateConverted = convertirFecha(birthdayInPut!);

  if (dateConverted == null) {
    print('la fecha ingresada es incorrecata, has digitado : $birthdayInPut ');
    return;
  } //fin si

  // instancia para clase persona

  var persona = Persona(
    name: nameInPut,
    birthday: dateConverted,
    age: DateTime.now().year - dateConverted.year,
  );

  print('TU NOMBRE ES: ${persona.name}');
  print('tu FECHA DE NACIMIENTO ES: ${persona.birthday} ');
  print('TU EDAD ES: ${persona.age}');
} // fin main


//Funcion para manejo de la fecha
DateTime? convertirFecha(String date){
List<String>parts =date.split('/');
if(parts.length!=3){
return null;
}else{
  return DateTime.tryParse('${parts[2]}-${parts[1]}-${parts[0]}');
}

}// fin metodo convertir fecha


//clase persona
class Persona {
  final String? name;
  final DateTime? birthday;
  final int? age;

  Persona({this.name, this.birthday, this.age});
}
