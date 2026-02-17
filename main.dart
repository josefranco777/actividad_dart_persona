import 'dart:convert';

//  PRIMERO la clase
class Persona {
  String nombre;
  int edad;
  String ciudad;

  Persona(this.nombre, this.edad, this.ciudad);

  Persona.desdeJson(String jsonString) : nombre = '', edad = 0, ciudad = '' {
    final datos = jsonDecode(jsonString);
    nombre = datos['nombre'];
    edad = datos['edad'];
    ciudad = datos['ciudad'];
  }

  void saludar() {
    print("Hola, soy $nombre y vivo en $ciudad.");
  }

  void calcularAnioNacimiento(int anioActual) {
    int anioNacimiento = anioActual - edad;
    print("$nombre nació en el año $anioNacimiento.");
  }

  void despedida() => print("$nombre se despide.");

  int multiplicarEdad(int numero) => edad * numero;
}

// DESPUES el main
void main() {
  Persona persona1 = Persona("jose ", 20, "Cartagena");

  print("----- PRUEBA CONSTRUCTOR NORMAL -----");
  persona1.saludar();
  persona1.calcularAnioNacimiento(2025);
  persona1.despedida();
  print("Edad multiplicada por 3: ${persona1.multiplicarEdad(3)}");

  print("");

  String jsonString = '{"nombre":"Carlos","edad":25,"ciudad":"Barranquilla"}';

  Persona persona2 = Persona.desdeJson(jsonString);

  print("----- PRUEBA CONSTRUCTOR JSON -----");
  persona2.saludar();
  persona2.calcularAnioNacimiento(2025);
  persona2.despedida();
  print("Edad multiplicada por 2: ${persona2.multiplicarEdad(2)}");
}
