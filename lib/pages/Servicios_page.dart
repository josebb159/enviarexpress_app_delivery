import 'package:flutter/material.dart';

class ServiciosPage extends StatelessWidget {
  const ServiciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2A1A64); // Morado
    final Color accentColor = const Color(0xFFDA8E00); // Naranja
    final Color backgroundColor = const Color(0xFFF5F5F5); // Gris claro
    final Color textSecondary = const Color(0xFF333333); // Negro suave

    // Datos ficticios
    final List<Map<String, dynamic>> pendientes = [
      {
        "imagen": "https://randomuser.me/api/portraits/men/32.jpg",
        "cliente": "Carlos Pérez",
        "valor": 25000,
        "direccion": "Cra 45 #12-34",
        "calificacion": 4.5
      },
      {
        "imagen": "https://randomuser.me/api/portraits/women/44.jpg",
        "cliente": "María Gómez",
        "valor": 30000,
        "direccion": "Calle 80 #24-56",
        "calificacion": 5.0
      },
    ];

    final List<Map<String, dynamic>> enProceso = [
      {
        "imagen": "https://randomuser.me/api/portraits/men/55.jpg",
        "cliente": "Juan Torres",
        "valor": 18000,
        "direccion": "Av. Siempre Viva 123",
        "calificacion": 3.5
      },
    ];

    final List<Map<String, dynamic>> terminados = [
      {
        "imagen": "https://randomuser.me/api/portraits/women/67.jpg",
        "cliente": "Laura Ríos",
        "valor": 22000,
        "direccion": "Cra 10 #9-99",
        "calificacion": 4.0
      },
      {
        "imagen": "https://randomuser.me/api/portraits/men/12.jpg",
        "cliente": "Andrés López",
        "valor": 40000,
        "direccion": "Calle 50 #20-10",
        "calificacion": 5.0
      },
    ];

    Widget buildServicioCard(Map<String, dynamic> servicio) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Imagen cliente
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(servicio["imagen"]),
              ),
              const SizedBox(width: 12),

              // Información
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      servicio["cliente"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      servicio["direccion"],
                      style: TextStyle(color: textSecondary, fontSize: 14),
                    ),
                    Text(
                      "\$ ${servicio["valor"]}",
                      style: TextStyle(
                          color: accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        double rating = servicio["calificacion"];
                        return Icon(
                          index < rating.round()
                              ? Icons.star
                              : Icons.star_border,
                          size: 18,
                          color: Colors.amber,
                        );
                      }),
                    )
                  ],
                ),
              ),

              // Botón detalle
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Acción detalle
                },
                child: const Text(
                  "Detalle",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Mis Servicios"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Pendientes"),
              Tab(text: "En Proceso"),
              Tab(text: "Terminados"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: pendientes.length,
              itemBuilder: (context, index) =>
                  buildServicioCard(pendientes[index]),
            ),
            ListView.builder(
              itemCount: enProceso.length,
              itemBuilder: (context, index) =>
                  buildServicioCard(enProceso[index]),
            ),
            ListView.builder(
              itemCount: terminados.length,
              itemBuilder: (context, index) =>
                  buildServicioCard(terminados[index]),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
