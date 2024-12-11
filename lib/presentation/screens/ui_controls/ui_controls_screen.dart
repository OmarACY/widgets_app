import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls + Tiles'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, plane, boat }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloperMode = false;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Activar modo desarrollador'),
          value: isDeveloperMode,
          onChanged: (value) => setState(() => isDeveloperMode = !isDeveloperMode), 
          ),
          RadioListTile(
            title: const Text('Car'),
            subtitle: const Text('Vehículo terrestre'),
            value: Transportation.car,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.car;
          })),
          RadioListTile(
            title: const Text('Biycle'),
            subtitle: const Text('Vehículo terrestre'),
            value: Transportation.bike,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.bike;
          })),
          RadioListTile(
            title: const Text('Plane'),
            subtitle: const Text('Vehículo aéreo'),
            value: Transportation.plane,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.plane;
          })),
          RadioListTile(
            title: const Text('Boat'),
            subtitle: const Text('Vehículo acuático'),
            value: Transportation.boat,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.boat;
          })),
      ],
    );
  }
}
