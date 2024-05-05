import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/my_ads/my_ads_screen.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Conta'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            GetIt.I<UserManagerStore>().user?.name ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.purple,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            GetIt.I<UserManagerStore>().user?.email ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.purple),
                        child: const Text('Editar'),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Meus Anúncios',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.purple,
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyAdsScreen(),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Favoritos',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.purple,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
