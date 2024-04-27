import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/create_ad/components/category_field.dart';
import 'package:xlo_mobx/screens/create_ad/components/hide_phone_field.dart';
import 'package:xlo_mobx/screens/create_ad/components/images_field.dart';
import 'package:xlo_mobx/screens/create_ad/components/zip_code_field.dart';
import 'package:xlo_mobx/stores/create_ad.dart';

class CreateAdScreen extends StatelessWidget {
  const CreateAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateAdStore createAdStore = CreateAdStore();

    const labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );
    const contentPaddingTextFormField = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImagesField(
                      createAdStore: createAdStore,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Título *',
                        labelStyle: labelStyle,
                        contentPadding: contentPaddingTextFormField,
                        errorText: createAdStore.titleError.isEmpty
                            ? null
                            : createAdStore.titleError,
                      ),
                      textCapitalization: TextCapitalization.words,
                      onChanged: createAdStore.setTitle,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Descrição *',
                        labelStyle: labelStyle,
                        contentPadding: contentPaddingTextFormField,
                        errorText: createAdStore.descriptionError.isEmpty
                            ? null
                            : createAdStore.descriptionError,
                      ),
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: createAdStore.setDescription,
                    ),
                    CategoryField(
                      createAdStore: createAdStore,
                    ),
                    ZipCodeField(
                      createAdStore: createAdStore,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Preço *',
                        labelStyle: labelStyle,
                        contentPadding: contentPaddingTextFormField,
                        errorText: createAdStore.priceError.isEmpty
                            ? null
                            : createAdStore.priceError,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CentavosInputFormatter(moeda: true),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: createAdStore.setPriceText,
                    ),
                    HidePhoneField(
                      createAdStore: createAdStore,
                    ),
                    SizedBox(
                      height: 50,
                      child: GestureDetector(
                        onTap: createAdStore.invalidSendPressed,
                        child: ElevatedButton(
                          onPressed: createAdStore.sendPressed,
                          style: ElevatedButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'Enviar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
