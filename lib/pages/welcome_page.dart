import 'package:flutter/material.dart';
import 'package:nft_project/main.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 51, 65),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [              
              
              Text(
                'Hey! Welcome',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

                        
              SizedBox(height: 20),

              
              Image.asset(
                'lib/assets/image1.png',
                width: 200,
                height: 200,
              ),


              SizedBox(height: 40),

              
    
              Text(
                'Create and Sell your NFT in 1 second',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),


              SizedBox(height: 16),


              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text("Go Home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
