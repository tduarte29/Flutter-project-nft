class NFTItem {
  final String id;
  final String name;
  final String imageUrl;
  final String collectionName;
  final String creator;
  final bool isVerified;
  final String price;
  final DateTime mintDate;

  NFTItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.collectionName,
    required this.creator,
    required this.isVerified,
    required this.price,
    required this.mintDate,
  });
}
