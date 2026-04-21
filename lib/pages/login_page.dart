import 'package:comparador_gasolina_alcool/pages/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {




  var emailController = new TextEditingController(text: "");
  var senhaController = new TextEditingController(text: "");
  bool isObscureText = true;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
                      const Icon(
                          Icons.local_gas_station, size: 160, color: Colors.blue),
                      const SizedBox(height: 40),
                      Text("Ja tem cadastro?", style: TextStyle(fontSize: 25)),
                      SizedBox(height: 10),
                      Text(
                        "Faça ja seu cadastro",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 30,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: emailController,
                          onChanged: (value){
                            //debugPrint(value);

                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.email, color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 30,
                        alignment: Alignment.center,
                        child: TextField(
                          obscureText: isObscureText,
                          controller: senhaController,
                          onChanged: (value){
                            //debugPrint(value);
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Senha",
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                  isObscureText ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              if(emailController.text.trim() == "email@email.com" && senhaController.text.trim() == "123"){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("erro ao efetuar login")));
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.green),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12),
                                ),
                              ),
                            ),
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 30,
                        alignment: Alignment.center,
                        child: Text("Esqueci a senha", style: TextStyle(fontSize: 18)),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 30,
                        alignment: Alignment.center,
                        child: Text("Cadastro", style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 190),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}