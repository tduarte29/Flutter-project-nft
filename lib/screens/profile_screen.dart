import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15202B), // Fundo escuro
      appBar: AppBar(
        backgroundColor: const Color(0xFF15202B),
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do perfil
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: const AssetImage('assets/images/azuki_collection.png'),
                backgroundColor: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16.0),
            // Nome do usuário
            Center(
              child: Text(
                'Karafuru',
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            // Descrição do perfil
            Center(
              child: Text(
                'Karafuru is home to 5,555 generative arts where colors reign supreme. Leave the drab reality and enter the world of Karafuru by Museum of Toys.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            // Estatísticas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('Items', '5,6K'),
                _buildStatCard('Owners', '3,7K'),
                _buildStatCard('Floor Price', '2.4 ETH'),
                _buildStatCard('Volume Trade', '36,3K ETH'),
              ],
            ),
            const SizedBox(height: 24.0),
            // Títulos das seções
            const Text(
              'Items',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            // Grid de itens
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                _buildItemCard('Futo #3791', '2,75 ETH', 'assets/images/boredapeyachtclub_collection.png'),
                _buildItemCard('Torao #784', '2,00 ETH', 'assets/images/azuki_collection.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para estatísticas
  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  // Widget para itens
  Widget _buildItemCard(String name, String price, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF252B41),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  price,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Colors.white70,
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