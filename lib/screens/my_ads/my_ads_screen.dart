import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/my_ads/components/active_tile.dart';
import 'package:xlo_mobx/screens/my_ads/components/pending_tile.dart';
import 'package:xlo_mobx/screens/my_ads/components/sold_tile.dart';
import 'package:xlo_mobx/stores/my_ads.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

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
    tabController = TabController(length: 3, vsync: this);
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
      body: TabBarView(
        controller: tabController,
        children: [
          Observer(
            builder: (context) => myAdsStore.activeAds.isEmpty
                ? Container()
                : ListView.builder(
                    itemCount: myAdsStore.activeAds.length,
                    itemBuilder: (context, index) => ActiveTile(
                      ad: myAdsStore.activeAds[index],
                    ),
                  ),
          ),
          Observer(
            builder: (context) => myAdsStore.pendingAds.isEmpty
                ? Container()
                : ListView.builder(
                    itemCount: myAdsStore.pendingAds.length,
                    itemBuilder: (context, index) => PendingTile(
                      ad: myAdsStore.pendingAds[index],
                    ),
                  ),
          ),
          Observer(
            builder: (context) => myAdsStore.soldAds.isEmpty
                ? Container()
                : ListView.builder(
                    itemCount: myAdsStore.soldAds.length,
                    itemBuilder: (context, index) => SoldTile(
                      ad: myAdsStore.soldAds[index],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
