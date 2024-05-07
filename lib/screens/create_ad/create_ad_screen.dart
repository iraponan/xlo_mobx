import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/components/drawer/custom_drawer.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/screens/create_ad/components/category_field.dart';
import 'package:xlo_mobx/screens/create_ad/components/hide_phone_field.dart';
import 'package:xlo_mobx/screens/create_ad/components/images_field.dart';
import 'package:xlo_mobx/screens/create_ad/components/postal_code_field.dart';
import 'package:xlo_mobx/screens/my_ads/my_ads_screen.dart';
import 'package:xlo_mobx/stores/create_ad.dart';
import 'package:xlo_mobx/stores/page.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({super.key, this.ad});

  final Ad? ad;

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  late CreateAdStore createAdStore;
  late bool editing;

  @override
  void initState() {
    super.initState();
    editing = widget.ad != null;
    createAdStore = CreateAdStore(ad: widget.ad ?? Ad());
    when(
      (p0) => createAdStore.savedAd,
      () {
        if (editing) {
          Navigator.of(context).pop(true);
        } else {
          GetIt.I<PageStore>().setPage(0);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const MyAdsScreen(initialPage: 1),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );
    const contentPaddingTextFormField = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: editing ? null : const CustomDrawer(),
      appBar: AppBar(
        title: editing
            ? const Text('Editar Anúncio')
            : const Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: createAdStore.loading
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              'Salvando Anúncio',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CircularProgressIndicator(),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImagesField(
                            createAdStore: createAdStore,
                          ),
                          TextFormField(
                            initialValue: createAdStore.title,
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
                            initialValue: createAdStore.description,
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
                          PostalCodeField(
                            createAdStore: createAdStore,
                          ),
                          TextFormField(
                            initialValue: createAdStore.priceText,
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
                          ErrorBox(
                            message: createAdStore.error,
                          ),
                          SizedBox(
                            height: 50,
                            child: GestureDetector(
                              onTap: createAdStore.invalidSendPressed,
                              child: ElevatedButton(
                                onPressed: createAdStore.sendPressed,
                                style: ElevatedButton.styleFrom(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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
