import 'package:mobile_app/utills/common_barrel.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('Starter Project'),
      ),
    );
  }
}
