import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/empty_card.dart';
import 'package:xlo_mobx/screens/my_ads/components/active_tile.dart';
import 'package:xlo_mobx/screens/my_ads/components/pending_tile.dart';
import 'package:xlo_mobx/screens/my_ads/components/sold_tile.dart';
import 'package:xlo_mobx/stores/my_ads.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key, this.initialPage = 0});

  final int initialPage;

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  final MyAdsStore myAdsStore = MyAdsStore();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Anúncios'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              child: Text('ATIVOS'),
            ),
            Tab(
              child: Text('PENDENTES'),
            ),
            Tab(
              child: Text('VENDIDOS'),
            ),
          ],
        ),
      ),
      body: Observer(
        builder: (context) => myAdsStore.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(
                controller: tabController,
                children: [
                  myAdsStore.activeAds.isEmpty
                      ? const EmptyCard(
                          text: 'Você não possui nenhum anúncio ativo.',
                        )
                      : ListView.builder(
                          itemCount: myAdsStore.activeAds.length,
                          itemBuilder: (context, index) => ActiveTile(
                            ad: myAdsStore.activeAds[index],
                            myAdsStore: myAdsStore,
                          ),
                        ),
                  myAdsStore.pendingAds.isEmpty
                      ? const EmptyCard(
                          text: 'Você não possui nenhum anúncio pendente.',
                        )
                      : ListView.builder(
                          itemCount: myAdsStore.pendingAds.length,
                          itemBuilder: (context, index) => PendingTile(
                            ad: myAdsStore.pendingAds[index],
                          ),
                        ),
                  myAdsStore.soldAds.isEmpty
                      ? const EmptyCard(
                          text: 'Você não possui nenhum anúncio vendido.',
                        )
                      : ListView.builder(
                          itemCount: myAdsStore.soldAds.length,
                          itemBuilder: (context, index) => SoldTile(
                            ad: myAdsStore.soldAds[index],
                            myAdsStore: myAdsStore,
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}
