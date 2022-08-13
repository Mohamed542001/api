part of 'LoginWidgetsImports.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({Key? key, required this.loginData}) : super(key: key);
  final LoginData loginData;

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.loginData.emailController,
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: (v){print(v);},
          onChanged: (v){print(v);},
          decoration: const InputDecoration(
            labelText: 'Email Address',
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(),


          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: widget.loginData.passwordController,
          obscureText: widget.loginData.visible,
          onFieldSubmitted: (value){
            print(value);
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Password',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  widget.loginData.visible = !widget.loginData.visible;
                });
              },
              icon: widget.loginData.visible
                  ? const Icon(Icons.visibility)
                  :const Icon(Icons.visibility_off),
            ),
          ),
        ),
      ],
    );
  }
}
