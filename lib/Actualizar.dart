import 'package:serfinanza/Home.dart';
import 'package:flutter/material.dart';
import 'package:serfinanza/textBox.dart';

class Actualizar extends StatefulWidget {
  final Contacto _Contacto;
  Actualizar(this._Contacto);
  @override
  State<StatefulWidget> createState() => _Actualizar();
}

class _Actualizar extends State<Actualizar> {
  TextEditingController controllerNombre;
  TextEditingController controllerDireccion;
  TextEditingController controllerCelular;
  TextEditingController controllerCorreo;

  @override
  void initState() {
    Contacto c = widget._Contacto;
    controllerNombre = new TextEditingController(text: c.Nombre);
    controllerDireccion = new TextEditingController(text: c.Direccion);
    controllerCelular = new TextEditingController(text: c.Celular);
    controllerCorreo = new TextEditingController(text: c.Correo);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Contacto"),
        backgroundColor: Colors.redAccent,
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
            child: Text("Guardar Contacto"),
          ),
        ],
      ),
    );
  }
}
