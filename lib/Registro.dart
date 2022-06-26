import 'package:serfinanza/Home.dart';
import 'package:serfinanza/textBox.dart';
import 'package:flutter/material.dart';

class RegisterContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<RegisterContact> {
  TextEditingController controllerNombre;
  TextEditingController controllerDireccion;
  TextEditingController controllerCelular;
  TextEditingController controllerCorreo;

  @override
  void initState() {
    controllerNombre = new TextEditingController();
    controllerDireccion = new TextEditingController();
    controllerCelular = new TextEditingController();
    controllerCorreo = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Contactos"),
        ),
        body: ListView(
          children: [
            TextBox(controllerNombre, "Nombre"),
            TextBox(controllerDireccion, "Direccion"),
            TextBox(controllerCelular, "Celular"),
            TextBox(controllerCorreo, "Correo"),
            ElevatedButton(
                onPressed: () {
                  String nombre = controllerNombre.text;
                  String direccion = controllerDireccion.text;
                  String celular = controllerCelular.text;
                  String correo = controllerCorreo.text;

                  if (nombre.isNotEmpty &&
                      direccion.isNotEmpty &&
                      celular.isNotEmpty &&
                      correo.isNotEmpty) {
                    Navigator.pop(
                        context,
                        new Contacto(
                            Nombre: nombre,
                            Direccion: direccion,
                            Celular: celular,
                            Correo: correo));
                  }
                },
                child: Text("Guardar Contacto")),
          ],
        ));
  }
}
