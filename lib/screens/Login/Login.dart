part of 'LoginImports.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  LoginData loginData = LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BuildLoginText(),
                  const SizedBox(
                    height: 40,
                  ),
                  BuildLoginForm(loginData: loginData,),
                  const SizedBox(
                    height: 40,
                  ),
                  BuildLoginButtons(loginData: loginData),
                  const SizedBox(
                    height: 20,
                  ),
                  const BuildNotHaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
