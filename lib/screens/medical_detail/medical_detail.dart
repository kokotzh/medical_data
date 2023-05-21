import 'package:flutter/material.dart';

import 'package:medical_data/provider/medser_pro.dart';
import 'package:provider/provider.dart';

class MedicalDetail extends StatelessWidget {
  const MedicalDetail({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var item = context.watch<MedicalProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(item.medicines[index].attributes.name),
      ),
      body: ListView(
        children: [
          Hero(
            tag: item.medicines[index].attributes.name,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              child: Image.network(
                item.medicines[index].attributes.img,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : Container(
                          alignment: Alignment.center,
                          width: 10,
                          height: 10,
                          child: const CircularProgressIndicator(),
                        );
                },
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            ),
          ),
          detailRow('Name:', item.medicines[index].attributes.name),
          detailRow('Chemical Name:', item.medicines[index].attributes.chName),
          detailRow('Made In:', item.medicines[index].attributes.madeIn),
          detailRow('Packaging:', item.medicines[index].attributes.pack),
          detailRow('PerBox:', item.medicines[index].attributes.perBox),
          detailRow('Price:', item.medicines[index].attributes.price),
          detailRow('Regulatory:', item.medicines[index].attributes.regulatory),
          detailRow('Category:', item.medicines[index].attributes.category),
          detailRow('Tags:', item.medicines[index].attributes.tags),
        ],
      ),
    );
  }

  Widget detailRow(String staticName, String dynamicName) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Text(staticName),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(dynamicName),
            ),
          ),
        ],
      ),
    );
  }
}
