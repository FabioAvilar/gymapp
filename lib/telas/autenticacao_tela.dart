import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/minhas_cores.dart';
import 'package:flutter_gymapp/componentes/decoracao_campo_autenticacao.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MinhasCores.azulTopoGradiente,
                  MinhasCores.azulBaixoGradiente,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 128,
                      ),
                      const Text(
                        "GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null) {
                            return "o email nao pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "o email é muito curto";
                          }
                          if (!value.contains("@")) {
                            return "o email nao é valido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "a senha nao pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "a senha é muito curto";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAuthenticationInputDecoration(
                                  "Confirme a senha."),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "a senha nao pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "a senha é muito curto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              controller: _nomeController,
                              decoration:
                                  getAuthenticationInputDecoration("Nome"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "o nome nao pode ser vazio";
                                }
                                if (value.length < 3) {
                                  return "o nome é muito curto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          botaoPrincipalClicado();
                        },
                        child: Text((queroEntrar) ? "Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text((queroEntrar)
                            ? "Ainda não tem uma conta cadastre-se!"
                            : "Ja tem uma conta entre!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  botaoPrincipalClicado() {
    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada Validada!");
      } else {
        print("Cadastro invalido");
        print(
            "${_emailController.text}, ${_senhaController.text}, ${_nomeController.text}");
      }
    } else {
      print("Forma invalido!!");
    }
  }
}
