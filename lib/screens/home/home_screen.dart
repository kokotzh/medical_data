import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_data/screens/medical_detail/medical_detail.dart';
import 'package:medical_data/provider/medser_pro.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MedicalProvider>(context, listen: false).getMed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Data'),
      ),
      body: Consumer<MedicalProvider>(
        builder: (context, __, child) {
          if (__.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final meds = __.medicines;

          return RefreshIndicator(
            onRefresh: __.getMed,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: meds.length,
              itemBuilder: (context, index) {
                final item = meds[index];
                return Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: InkWell(
                    splashColor: const Color(0xff6750a4).withOpacity(0.3),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) => MedicalDetail(
                          index: index,
                        ),
                      ));
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Hero(
                          tag: item.attributes.name,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: Image.network(
                              item.attributes.img,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                return loadingProgress == null
                                    ? child
                                    : Container(
                                        alignment: Alignment.center,
                                        width: 10,
                                        height: 10,
                                        child:
                                            const CircularProgressIndicator(),
                                      );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 1,
                          right: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.only(
                                left: 5, right: 5, top: 5),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                item.attributes.name,
                                style:
                                    const TextStyle(color: Color(0xFF2331F7)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add'),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
