import 'package:flutter/material.dart';
import 'package:flutter_location_search2/flutter_location_search2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _locationText = 'Tap here to search a place';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location Picker',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Builder(builder: (context) {
            return TextButton(
              child: Text(_locationText),
              onPressed: () async {
                LocationData? locationData = await LocationSearch.show(
                    context: context,
                    lightAddress: true,
                    googlePlacesSearchKey:
                        "AIzaSyBdHEPmfuoVSmzh4RP-xlmvhPgxm2GdH7o",
                    mode: Mode.overlay,
                    userAgent: UserAgent(
                        appName: 'Location Search Example',
                        email: 'support@myapp.com'));

                if (locationData == null) return;

                _locationText = locationData.address;
                setState(() {});
              },
            );
          }),
        ),
      ),
    );
  }
}
