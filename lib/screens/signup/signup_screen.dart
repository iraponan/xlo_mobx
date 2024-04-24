import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signup.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpStore signUpStore = SignUpStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ErrorBox(
                            message: signUpStore.error,
                          ),
                        );
                      },
                    ),
                    const FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.',
                    ),
                    Observer(
                      builder: (BuildContext context) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Exemplo: João Pedro',
                            isDense: true,
                            errorText: signUpStore.nameError,
                          ),
                          textCapitalization: TextCapitalization.words,
                          onChanged: signUpStore.setName,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação.',
                    ),
                    Observer(
                      builder: (context) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Exemplo: joao@seuemail.com',
                            isDense: true,
                            errorText: signUpStore.emailError,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          onChanged: signUpStore.setEmail,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta.',
                    ),
                    Observer(
                      builder: (context) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Exemplo: (99) 99999-9999)',
                            isDense: true,
                            errorText: signUpStore.phoneError,
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          onChanged: signUpStore.setPhone,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais.',
                    ),
                    Observer(
                      builder: (context) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: true,
                              errorText: signUpStore.pass1Error),
                          obscureText: true,
                          onChanged: signUpStore.setPass1,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'Confirmar a senha',
                      subtitle: 'Repita a senha.',
                    ),
                    Observer(
                      builder: (context) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: true,
                              errorText: signUpStore.pass2Error),
                          obscureText: true,
                          onChanged: signUpStore.setPass2,
                        );
                      },
                    ),
                    Observer(
                      builder: (context) {
                        return Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 12),
                          height: 40,
                          child: ElevatedButton(
                            onPressed: signUpStore.signUpPressed,
                            child: signUpStore.loading
                                ? const CircularProgressIndicator()
                                : const Text('Cadastrar'),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            'Já tem uma conta? ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
