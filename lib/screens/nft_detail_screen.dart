import 'package:flutter/material.dart';
import '../widgets/nft/nft_detail_header.dart';
import '../widgets/nft/nft_detail_info.dart';
import '../widgets/nft/nft_detail_bid_bar.dart';

class NftDetailScreen extends StatelessWidget {
  const NftDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF15202B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NftDetailHeader(
                height: size.height * 0.38,
                imagePath: 'assets/images/mosu_1930.png',
                onBack: () => Navigator.of(context).pop(),
                onFilter: () {},
                onShare: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: NftDetailInfo(),
              ),
              const SizedBox(height: 16.0), // Espaço para o botão fixo
            ],
          ),
        ),
      ),
      bottomNavigationBar: NftDetailBidBar(
        price: '2,75 ETH',
        onBid: () {
          // Ação de fazer uma oferta
        },
      ),
    );
  }
}
