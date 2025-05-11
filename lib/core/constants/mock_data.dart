import '../../shared/models/nft_collection.dart';
import '../../shared/models/nft_item.dart';

class MockData {
  static final List<NFTCollection> collections = [
    NFTCollection(
      id: '1',
      name: 'Doodles',
      imageUrl: 'assets/images/collection1.png',
      floorPrice: '0.5',
      volume: '4.2K',
      isVerified: true,
    ),
    NFTCollection(
      id: '2',
      name: 'CoolCats',
      imageUrl: 'assets/images/collection2.png',
      floorPrice: '0.32',
      volume: '6.1K',
      isVerified: true,
    ),
    NFTCollection(
      id: '3',
      name: 'Art Blocks',
      imageUrl: 'assets/images/collection3.png',
      floorPrice: '1.2',
      volume: '8.5K',
      isVerified: true,
    ),
    NFTCollection(
      id: '4',
      name: 'Azuki',
      imageUrl: 'assets/images/collection4.png',
      floorPrice: '0.8',
      volume: '5.6K',
      isVerified: false,
    ),
  ];

  static final List<NFTItem> nftItems = [
    NFTItem(
      id: '1',
      name: 'Mosu #1930',
      imageUrl: 'assets/images/nft1.png',
      collectionName: 'Karafuru',
      creator: 'KarafuruCreator',
      isVerified: true,
      price: '2.75 ETH',
      mintDate: DateTime(2022, 6, 24),
    ),
    NFTItem(
      id: '2',
      name: 'CoolCat #532',
      imageUrl: 'assets/images/nft2.png',
      collectionName: 'CoolCats',
      creator: 'CoolCatsTeam',
      isVerified: true,
      price: '1.45 ETH',
      mintDate: DateTime(2022, 3, 15),
    ),
    NFTItem(
      id: '3',
      name: 'Bored Ape #7834',
      imageUrl: 'assets/images/nft3.png',
      collectionName: 'BAYC',
      creator: 'YugaLabs',
      isVerified: true,
      price: '89.2 ETH',
      mintDate: DateTime(2021, 10, 10),
    ),
    NFTItem(
      id: '4',
      name: 'Doodle #2345',
      imageUrl: 'assets/images/nft4.png',
      collectionName: 'Doodles',
      creator: 'DoodleCreator',
      isVerified: true,
      price: '12.5 ETH',
      mintDate: DateTime(2022, 1, 5),
    ),
  ];
}
