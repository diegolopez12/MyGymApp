import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userID = const Uuid().v4();

    return Scaffold(
      backgroundColor: Colors.grey[200], // Fondo de toda la pantalla
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Código QR',
          style: TextStyle(
            fontSize: 24, // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Texto en negrita
            color: Colors.black,
          ), // Color de texto en el AppBar
        ),
        backgroundColor: Colors.transparent, // Fondo del AppBar transparente
        elevation: 0, // Sin sombra en el AppBar
        iconTheme: const IconThemeData(
            color: Colors.black87), // Color de los íconos en el AppBar
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24), // Bordes redondeados
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Escanear QR para registro de Asistencia',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                QrImageView(
                  data: userID,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
