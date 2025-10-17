import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2A1A64); // Morado
    final Color accentColor = const Color(0xFFDA8E00); // Naranja
    final Color backgroundColor = const Color(0xFFF5F5F5); // Gris claro

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Enviar Express"),
            Row(
              children: [
                const Icon(Icons.account_balance_wallet, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  "\$ 120.000", // Aquí podrías traer el saldo real
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),

      // Drawer - Menú lateral
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: const Center(
                child: Text(
                  'Menú Principal',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.delivery_dining, color: accentColor),
              title: const Text("Mis Servicios"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person, color: accentColor),
              title: const Text("Mi Perfil"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet, color: accentColor),
              title: const Text("Recargas"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.swap_horiz, color: accentColor),
              title: const Text("Movimientos"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: accentColor),
              title: const Text("Salir"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Contenido principal (Mapa)
      body: Container(
        color: Colors.grey[300],
        child: const Center(
          child: Text(
            "Aquí irá el mapa",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ),

      // Botones flotantes
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "chat",
            backgroundColor: primaryColor,
            onPressed: () {
              // Acción chat
            },
            child: const Icon(Icons.chat, color: Colors.white),
          ),
          const SizedBox(height: 16),

        ],
      ),
    );
  }
}
