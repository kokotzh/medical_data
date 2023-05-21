import 'package:flutter/material.dart';
import 'package:medical_data/models/medicines.dart';
import 'package:medical_data/services/med_service.dart';

class MedicalProvider extends ChangeNotifier {
  final _medSer = MedicalService();

  bool isLoading = false;
  List<Medicines> _medicines = [];

  List<Medicines> get medicines => _medicines;

  Future<void> getMed() async {
    isLoading = true;
    notifyListeners();

    final response = await _medSer.getMedicines();

    _medicines = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> addMed(
    TextEditingController nctrl,
    TextEditingController chnctrl,
    TextEditingController mctrl,
    TextEditingController packctrl,
    TextEditingController boxctrl,
    TextEditingController regctrl,
    TextEditingController prictrl,
    TextEditingController cagctrl,
    TextEditingController tagctrl,
    TextEditingController imgctrl,
  ) async {
    await _medSer
        .createMedicines(
      nctrl.text,
      chnctrl.text,
      mctrl.text,
      packctrl.text,
      boxctrl.text,
      regctrl.text,
      prictrl.text,
      cagctrl.text,
      tagctrl.text,
      imgctrl.text,
    )
        .then((value) {
      getMed();
    });
    notifyListeners();
  }
}
