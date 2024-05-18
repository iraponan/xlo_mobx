import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/stores/edit_account.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditAccountStore editAccountStore = EditAccountStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Conta'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ErrorBox(
                          message: editAccountStore.error,
                        ),
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) => IgnorePointer(
                          ignoring: editAccountStore.loading,
                          child: ToggleSwitch(
                            cornerRadius: 20,
                            minWidth: constraints.biggest.width / 2,
                            labels: const ['Particular', 'Profissional'],
                            activeBgColor: const [Colors.purple],
                            inactiveBgColor: Colors.grey,
                            activeFgColor: Colors.white,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: editAccountStore.userType?.index,
                            onToggle: editAccountStore.setUserType,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        enabled: !editAccountStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          labelText: 'Nome *',
                          errorText: editAccountStore.nameError,
                        ),
                        initialValue: editAccountStore.name,
                        onChanged: editAccountStore.setName,
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        enabled: !editAccountStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          labelText: 'Telefone *',
                          errorText: editAccountStore.phoneError,
                        ),
                        initialValue: editAccountStore.phone,
                        onChanged: editAccountStore.setPhone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        enabled: !editAccountStore.loading,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          labelText: 'Nova Senha',
                        ),
                        onChanged: editAccountStore.setPass1,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        enabled: !editAccountStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          labelText: 'Confirme Nova Senha',
                          errorText: editAccountStore.passError,
                        ),
                        onChanged: editAccountStore.setPass2,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        onPressed: editAccountStore.savePressed,
                        child: editAccountStore.loading
                            ? const CircularProgressIndicator()
                            : const Text('Salvar'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Sair'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
