import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/premium_feature_text/premium_feature_text.dart';
import 'package:music_lyrica/common/widgets/premium_pack/premium_pack.dart';
import 'package:music_lyrica/common/widgets/special/avatar.dart';

class PremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(13, 3, 25, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70, left: 30),
                    width: 190,
                    child: Text(
                      'Upgrade      to Premium',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            letterSpacingDelta: 4,
                          ),
                    ),
                  ),
                  // Avatar
                  Container(
                      margin: EdgeInsets.only(top: 70, left: 120),
                      child: Avatar(height: 50, width: 50)),
                ],
              ),

              //Banner
              Container(
                margin: EdgeInsets.only(top: 40),
                height: 180,
                width: 360,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(152, 103, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              // Features

              Container(
                margin: EdgeInsets.only(top: 40, left: 100),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 100, bottom: 20),
                      child: Text('Full access',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    PremiumFeatureText(text: 'Puslish your own music'),
                    PremiumFeatureText(text: 'Ad-free experience'),
                    PremiumFeatureText(text: 'Personalized playlists'),
                    PremiumFeatureText(text: 'AI-powered suggestions'),
                  ],
                ),
              ),

              // pack
              Container(
                margin: EdgeInsets.only(top: 30),
                child: PremiumPack(
                  isBestChoice: true,
                  title: 'Annual',
                  price: '\$19.99/year',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: PremiumPack(
                    isBestChoice: false,
                    title: 'Monthly',
                    price: '\$1.99/month'),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                child: PremiumPack(
                  isBestChoice: false,
                  title: 'Mini',
                  price: '\$0.09/day',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
