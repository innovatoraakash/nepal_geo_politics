import 'package:flutter/material.dart';
import 'package:nepal_administrative_division/enums.dart';
import 'package:nepal_administrative_division/nepal_administrative_division.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            
            const NepalAdminstrativeArea(
              areaType: AreaType.province,
            ),
            const NepalAdminstrativeArea(
              areaType: AreaType.district,
            ),
            const NepalAdminstrativeArea(
              areaType: AreaType.localLevel,
            ),
            NepalAdminstrativeArea(
              provinceLabel: "state",
              useNepaliText: true,
              ontap: (value, areatype) {
                debugPrint(value);
                debugPrint(areatype.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
