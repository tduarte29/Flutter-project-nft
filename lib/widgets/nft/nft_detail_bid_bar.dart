import 'package:flutter/material.dart';

class NftDetailBidBar extends StatelessWidget {
  final String price;
  final VoidCallback? onBid;
  const NftDetailBidBar({super.key, required this.price, this.onBid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color(0xFF252B41),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.diamond_outlined,
                  color: Colors.white, size: 24.0),
              const SizedBox(width: 8.0),
              Text(
                price,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: onBid,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D9BF0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            icon: const Icon(Icons.wallet, color: Colors.white),
            label: const Text(
              'Place a Bid',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
