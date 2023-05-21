part of '../add_medical_screen.dart';

class _AddForm extends StatelessWidget {
  const _AddForm({
    // super.key,
    required GlobalKey<FormState> gkey,
    required this.nameController,
    required this.chNameController,
    required this.madeInController,
    required this.packController,
    required this.perBoxController,
    required this.regulatoryController,
    required this.priceController,
    required this.categoryController,
    required this.tagsController,
    required this.imgController,
    required this.item,
  }) : _key = gkey;

  final GlobalKey<FormState> _key;
  final TextEditingController nameController;
  final TextEditingController chNameController;
  final TextEditingController madeInController;
  final TextEditingController packController;
  final TextEditingController perBoxController;
  final TextEditingController regulatoryController;
  final TextEditingController priceController;
  final TextEditingController categoryController;
  final TextEditingController tagsController;
  final TextEditingController imgController;
  final MedicalProvider item;

  @override
  Widget build(BuildContext context) {
    Widget buildTextFormField(controller, String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: AppTextFormField(controller: controller, text: text),
      );
    }

    return Form(
      key: _key,
      child: SliverList.list(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                buildTextFormField(nameController, "Name"),
                buildTextFormField(chNameController, "Chemical Name"),
                buildTextFormField(madeInController, "Made In"),
                buildTextFormField(packController, "Packaging"),
                buildTextFormField(perBoxController, "Per Box"),
                buildTextFormField(regulatoryController, "Regulatory"),
                buildTextFormField(priceController, "Price"),
                buildTextFormField(categoryController, "Category"),
                buildTextFormField(tagsController, "Tags"),
                buildTextFormField(imgController, "Image"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppBtn(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        item
                            .addMed(
                              nameController,
                              chNameController,
                              madeInController,
                              packController,
                              perBoxController,
                              regulatoryController,
                              priceController,
                              categoryController,
                              tagsController,
                              imgController,
                            )
                            .then((value) => context.pop());
                      }
                    },
                    text: 'Save',
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
