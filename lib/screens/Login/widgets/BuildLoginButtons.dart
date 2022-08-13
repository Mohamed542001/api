part of 'LoginWidgetsImports.dart';

class BuildLoginButtons extends StatelessWidget {
  const BuildLoginButtons({Key? key, required this.loginData}) : super(key: key);
  final LoginData loginData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.red,
          child: MaterialButton(
            onPressed: (){
              print(loginData.emailController.text);
              print(loginData.passwordController.text);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_)=> const Home()),
              );
            },
            child: const Text(
              'Login',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          color: Colors.red,
          child: MaterialButton(
            onPressed: (){
            },
            child: const Text(
              'Register',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }
}
