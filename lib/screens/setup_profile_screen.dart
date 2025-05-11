import 'package:flutter/material.dart';
import 'search_screen.dart';

class SetupProfileScreen extends StatelessWidget {
  const SetupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15202B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const SearchScreen(selectedIndex: 1),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 400),
              ),
            );
          },
        ),
        title: const Text(
          'Setup Profile',
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Upload Photo Profile',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/default_profile.png'), // Substitua pelo seu asset
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: const Color(0xFF252B41),
                          width: 2.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1D9BF0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 180.0,
                  height: 45.0,
                  child: OutlinedButton(
                    onPressed: () {
                      // Adicionar lógica de upload
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF252B41), width: 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Upload Profile',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Username',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: Color(0xFFAAB8C2),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: const Color(0xFF252B41),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'kevin',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Email',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: Color(0xFFAAB8C2),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: const Color(0xFF252B41),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Luke36@rocketmail.com',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Bio',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: Color(0xFFAAB8C2),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFF252B41),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Bio',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Adicionar lógica de submissão
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D9BF0),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}