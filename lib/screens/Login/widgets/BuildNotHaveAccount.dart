part of 'LoginWidgetsImports.dart';

class BuildNotHaveAccount extends StatelessWidget {
  const BuildNotHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account'),
        TextButton(
            onPressed: (){},
            child: const Text('Register')
        )
      ],
    );
  }
}
