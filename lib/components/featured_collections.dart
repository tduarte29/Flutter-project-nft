import 'package:flutter/material.dart';
import '../screens/nft_detail_screen.dart';

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
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: <Widget>[
              _buildCollectionCard(
                context: context,
                image: 'assets/images/dourdarce_collection.png',
                name: 'DourDarceIs',
                items: '10K',
                owners: '4,93K',
              ),
              _buildCollectionCard(
                context: context,
                image: 'assets/images/cyberbrokers_collection.png',
                name: 'CyberBrokersDeployer',
                items: '10K',
                owners: '4,93K',
              ),
              _buildCollectionCard(
                context: context,
                image: 'assets/images/boredapeyachtclub_collection.png',
                name: 'BoredApeYachtClub',
                items: 'Items',
                owners: 'Owners',
              ),
              _buildCollectionCard(
                context: context,
                image: 'assets/images/azuki_collection.png',
                name: 'Azuki',
                items: 'Items',
                owners: 'Owners',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCollectionCard({
    required BuildContext context,
    required String image,
    required String name,
    required String items,
    required String owners,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const NftDetailScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 400),
          ),
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
                      image: AssetImage(image),
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
                        name,
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
                              items,
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
                              owners,
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
