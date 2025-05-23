import 'package:flutter/material.dart';
import '../widgets/featured_collections.dart';
import '../widgets/art_category/art_category_info.dart';

class ArtCategoryScreen extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const ArtCategoryScreen({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15202B),
      body: Stack(
        children: [
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20.0)),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Color(0xFF252B41).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: IconButton(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(8.0),
                          iconSize: 21.0,
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 120.0),
                ArtCategoryInfo(
                  title: title,
                  description: description,
                ),
                const SizedBox(height: 20.0),
                const Expanded(
                  child: SingleChildScrollView(
                    child: FeaturedCollections(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
