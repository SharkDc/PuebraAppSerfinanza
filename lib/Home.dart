import 'package:serfinanza/Mensaje.dart';
import 'package:serfinanza/Actualizar.dart';
import 'package:serfinanza/Registro.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Contacto> contactos = [
    Contacto(
        Nombre: 'Will Mora',
        Direccion: 'calle 74 #25-14',
        Celular: '302 454 25 93',
        Correo: 'WillMora@gmail.com'),
    Contacto(
        Nombre: 'Sam Perez',
        Direccion: 'calle 74 #25-14',
        Celular: '322 412 34 68',
        Correo: 'luis14tf@gmail.com'),
    Contacto(
        Nombre: 'Marlon Gutierrez',
        Direccion: 'calle 74 #25-14',
        Celular: '301 441 36 98',
        Correo: 'luis@gmail.com'),
    Contacto(
        Nombre: 'Jhon Segura',
        Direccion: 'calle 74 #25-14',
        Celular: '310 789 90 62',
        Correo: 'luistf22@gmail.com')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: contactos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Actualizar(contactos[index])))
                  .then((nuevoContacto) {
                if (nuevoContacto != null) {
                  setState(() {
                    contactos.removeAt(index);

                    contactos.insert(index, nuevoContacto);

                    messageResponse(context,
                        nuevoContacto.Nombre + " a sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeContacto(context, contactos[index]);
            },
            title: Text(contactos[index].Nombre),
            subtitle: Text(contactos[index].Celular),
            leading: CircleAvatar(
              child: Text(contactos[index].Nombre.substring(0, 1)),
              foregroundColor: Colors.white,
              backgroundColor: Colors.redAccent,
            ),
            trailing: Icon(
              Icons.call,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterContact()))
              .then((nuevoContacto) {
            if (nuevoContacto != null) {
              setState(() {
                contactos.add(nuevoContacto);
                messageResponse(
                    context, nuevoContacto.Nombre + " a sido guardado...!");
              });
            }
          });
        },
        tooltip: "Agregar Contacto",
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        focusColor: Colors.blueAccent,
        hoverColor: Colors.redAccent,
      ),
    );
  }

  removeContacto(BuildContext context, Contacto Contacto) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Contactoe"),
              content:
                  Text("Esta seguro de eliminar a " + Contacto.Nombre + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.contactos.remove(Contacto);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.amber[900]),
                  ),
                )
              ],
            ));
  }
}

class Contacto {
  var Nombre;
  var Direccion;
  var Celular;
  var Correo;

  Contacto({this.Nombre, this.Direccion, this.Celular, this.Correo});
}
