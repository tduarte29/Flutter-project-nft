import 'package:flutter/material.dart';
import '../models/model.dart';
import '../utils/routes.dart';

class FeaturedCollections extends StatelessWidget {
  const FeaturedCollections({
    super.key,
    this.title = 'Featured Collections',
    this.showTitle = true,
  });

  final String title;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final List<NftModel> nfts = [
      NftModel(
        id: '1',
        name: 'DourDarceIs',
        imageUrl: 'assets/images/dourdarce_collection.png',
        description: 'A unique NFT from the DourDarce collection.',
        items: '10K',
        owners: '4,93K',
      ),
      NftModel(
        id: '2',
        name: 'CyberBrokersDeployer',
        imageUrl: 'assets/images/cyberbrokers_collection.png',
        description: 'A unique NFT from the CyberBrokers collection.',
        items: '10K',
        owners: '4,93K',
      ),
      NftModel(
        id: '3',
        name: 'BoredApeYachtClub',
        imageUrl: 'assets/images/boredapeyachtclub_collection.png',
        description: 'A unique NFT from the Bored Ape Yacht Club.',
        items: 'Items',
        owners: 'Owners',
      ),
      NftModel(
        id: '4',
        name: 'Azuki',
        imageUrl: 'assets/images/azuki_collection.png',
        description: 'A unique NFT from the Azuki collection.',
        items: 'Items',
        owners: 'Owners',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) ...[
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15.0),
        ],
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SizedBox(
            height: 400,
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: nfts.map((nft) => _buildCollectionCard(context: context, nft: nft)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCollectionCard({
    required BuildContext context,
    required NftModel nft,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.nftDetail,
          arguments: nft,
        );
      },
      child: SizedBox(
        width: 180,
        height: 220,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF252B41),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(nft.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        nft.name,
                        style: const TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Items',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Color(0xFFAAB8C2),
                              ),
                            ),
                            Text(
                              nft.items,
                              style: const TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            const Text(
                              'Owners',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Color(0xFFAAB8C2),
                              ),
                            ),
                            Text(
                              nft.owners,
                              style: const TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
