// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_colors.dart';

class StaticMapScreen extends StatelessWidget {
  final double latitude = 30.06427689471657;
  final double longitude = 31.227802705785955;
  const StaticMapScreen({super.key});

  // Function to open Google Maps with the specified coordinates
  Future<void> _openGoogleMaps() async {
    final url = 'https://www.google.com/maps?q=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.4),
            spreadRadius: 4,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(latitude, longitude),
          onTap: (tapPosition, point) {
            _openGoogleMaps();
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(latitude, longitude), // Coordinates for marker
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
