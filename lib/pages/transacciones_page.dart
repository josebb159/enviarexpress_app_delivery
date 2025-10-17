import 'package:flutter/material.dart';

class TransaccionesPage extends StatelessWidget {
  const TransaccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2A1A64); // Morado oscuro
    final Color accentColor = const Color(0xFFDA8E00); // Naranja
    final Color backgroundColor = const Color(0xFFF5F5F5); // Gris claro
    final Color textSecondary = const Color(0xFF333333); // Negro suave

    // Datos ficticios
    final List<Map<String, dynamic>> transacciones = [
      {
        "tipo": "Nequi",
        "icono": Icons.phone_android,
        "referencia": "REF123456",
        "valor": 50000,
        "fecha": "2025-09-20 10:30 AM"
      },
      {
        "tipo": "Daviplata",
        "icono": Icons.account_balance_wallet,
        "referencia": "REF654321",
        "valor": 120000,
        "fecha": "2025-09-21 3:45 PM"
      },
      {
        "tipo": "Bancolombia",
        "icono": Icons.account_balance,
        "referencia": "REF789012",
        "valor": 200000,
        "fecha": "2025-09-22 8:15 AM"
      },
    ];

    Widget buildCard(Map<String, dynamic> transaccion) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 26,
            child: Icon(transaccion["icono"], color: Colors.white, size: 28),
          ),
          title: Text(
            transaccion["tipo"],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
              fontSize: 16,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ref: ${transaccion["referencia"]}",
                  style: TextStyle(color: textSecondary)),
              Text("Fecha: ${transaccion["fecha"]}",
                  style: TextStyle(color: textSecondary, fontSize: 12)),
            ],
          ),
          trailing: Text(
            "\$ ${transaccion["valor"]}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Transacciones"),
      ),
      body: Container(
        color: backgroundColor,
        child: ListView.builder(
          itemCount: transacciones.length,
          itemBuilder: (context, index) {
            return buildCard(transacciones[index]);
          },
        ),
      ),
    );
  }
}
