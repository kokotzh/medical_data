import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_data/common/button.dart';
import 'package:medical_data/common/text_form_field.dart';
import 'package:medical_data/provider/medser_pro.dart';
import 'package:medical_data/services/med_service.dart';
import 'package:provider/provider.dart';
part 'widgets/add_sliver_header.dart';
part 'widgets/add_form.dart';

class AddMedicalScreen extends StatefulWidget {
  const AddMedicalScreen({super.key});

  @override
  State<AddMedicalScreen> createState() => _AddMedicalScreenState();
}

class _AddMedicalScreenState extends State<AddMedicalScreen> {
  var api = MedicalService();

  TextEditingController nameController = TextEditingController();
  TextEditingController chNameController = TextEditingController();
  TextEditingController madeInController = TextEditingController();
  TextEditingController packController = TextEditingController();
  TextEditingController perBoxController = TextEditingController();
  TextEditingController regulatoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController imgController = TextEditingController();

  final ScrollController scrollController = ScrollController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var item = context.read<MedicalProvider>();
    return Dialog(
      backgroundColor: const Color(0xFF292828),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        }),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            _AddSilverHeader(),
            _AddForm(
              gkey: _key,
              nameController: nameController,
              chNameController: chNameController,
              madeInController: madeInController,
              packController: packController,
              perBoxController: perBoxController,
              regulatoryController: regulatoryController,
              priceController: priceController,
              categoryController: categoryController,
              tagsController: tagsController,
              imgController: imgController,
              item: item,
            ),
          ],
        ),
      ),
    );
  }
}
