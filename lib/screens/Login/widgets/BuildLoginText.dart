part of 'LoginWidgetsImports.dart';

class BuildLoginText extends StatelessWidget {
  const BuildLoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
      ),
    );
  }
}
