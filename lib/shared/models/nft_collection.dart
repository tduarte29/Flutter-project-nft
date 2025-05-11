class NFTCollection {
  final String id;
  final String name;
  final String imageUrl;
  final String floorPrice;
  final String volume;
  final bool isVerified;

  NFTCollection({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.floorPrice,
    required this.volume,
    required this.isVerified,
  });
}
