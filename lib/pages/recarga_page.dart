import 'package:flutter/material.dart';

class RecargasPage extends StatelessWidget {
  const RecargasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2A1A64); // Morado oscuro
    final Color accentColor = const Color(0xFFDA8E00); // Naranja
    final Color backgroundColor = const Color(0xFFF5F5F5); // Gris claro
    final Color textSecondary = const Color(0xFF333333); // Negro suave

    void mostrarModal(String metodo) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (BuildContext context) {
          final TextEditingController montoController = TextEditingController();

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Recargar con $metodo",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: montoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Monto a recargar",
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Procesando recarga de \$${montoController.text} con $metodo...",
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Confirmar Recarga",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget buildOpcion(String titulo, IconData icono, String metodo) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 26,
            child: Icon(icono, color: Colors.white, size: 28),
          ),
          title: Text(
            titulo,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: textSecondary, size: 18),
          onTap: () => mostrarModal(metodo),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Recargar Monedero"),
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            buildOpcion("Recargar con ePayco", Icons.credit_card, "ePayco"),
            buildOpcion("Recargar con PayU", Icons.account_balance, "PayU"),
          ],
        ),
      ),
    );
  }
}
