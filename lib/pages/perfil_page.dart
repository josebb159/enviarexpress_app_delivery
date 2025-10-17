import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Gris claro
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A1A64), // Morado oscuro
        title: const Text(
          "Mi Perfil",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Encabezado del perfil
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Carlos Pérez",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2A1A64),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Domiciliario",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Tel: +57 310 456 7890",
                          style: TextStyle(
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Mini Dashboard
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildDashboardCard("Dinero Obtenido", "\$1,200,000",
                    Icons.monetization_on, Colors.green),
                _buildDashboardCard("Servicios Realizados", "85",
                    Icons.delivery_dining, const Color(0xFFDA8E00)),
                _buildDashboardCard("Servicios Finalizados", "80",
                    Icons.check_circle, Colors.blue),
                _buildDashboardCard(
                    "Calificación", "4.8 ★", Icons.star, Colors.orange),
              ],
            ),

            const SizedBox(height: 20),

            // Información adicional
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Información adicional",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2A1A64),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "📍 Dirección: Calle 123 #45-67, Bogotá",
                    style: TextStyle(color: Color(0xFF333333)),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "🆔 Identificación: CC 123456789",
                    style: TextStyle(color: Color(0xFF333333)),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "📧 Email: carlos.perez@email.com",
                    style: TextStyle(color: Color(0xFF333333)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2A1A64),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}
