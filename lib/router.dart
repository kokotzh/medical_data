import 'package:go_router/go_router.dart';
import 'package:medical_data/screens/add/add_medical_screen.dart';
import 'package:medical_data/screens/home/home_screen.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => const AddMedicalScreen(),
      ),
    ],
  );
}
