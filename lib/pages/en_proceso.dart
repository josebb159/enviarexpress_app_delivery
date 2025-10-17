import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServicioEnProcesoPage extends StatefulWidget {
  const ServicioEnProcesoPage({super.key});

  @override
  State<ServicioEnProcesoPage> createState() => _ServicioEnProcesoPageState();
}

class _ServicioEnProcesoPageState extends State<ServicioEnProcesoPage> {
  GoogleMapController? _mapController;

  final LatLng _clienteUbicacion = const LatLng(4.7110, -74.0721); // Bogotá ficticio

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Gris claro
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A1A64), // Morado oscuro
        title: const Text("Servicio en Proceso", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFDA8E00), // Naranja
        onPressed: () {
          // Abrir chat
        },
        child: const Icon(Icons.chat, color: Colors.white),
      ),
      body: Column(
        children: [
          // Info del cliente
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Cliente: Juan Pérez",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2A1A64),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Dirección: Calle 123 #45-67, Bogotá",
                  style: TextStyle(color: Color(0xFF333333)),
                ),
                SizedBox(height: 6),
                Text(
                  "Pedido: 2 Hamburguesas + 1 Gaseosa",
                  style: TextStyle(color: Color(0xFF333333)),
                ),
              ],
            ),
          ),

          // Mapa
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _clienteUbicacion,
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("cliente"),
                  position: _clienteUbicacion,
                  infoWindow: const InfoWindow(title: "Cliente Juan Pérez"),
                )
              },
              onMapCreated: (controller) => _mapController = controller,
            ),
          ),

          // Botones de acción
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción cancelar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Cancelar", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción entregar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2A1A64), // Morado oscuro
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Entregar", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
