import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.account_box_rounded)),
                      SizedBox(
                        width: 160,
                      ),
                      Text('tharwity', style: AppTextStyles.bodyText),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/Logo.png',
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
