import 'package:flutter/material.dart';
import 'package:medical_data/router.dart';
import 'package:medical_data/provider/medser_pro.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MedicalData());
}

class MedicalData extends StatelessWidget {
  const MedicalData({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MedicalProvider(),
      child: MaterialApp.router(
        title: 'MedicalData',
        routerConfig: goRouter(),
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
