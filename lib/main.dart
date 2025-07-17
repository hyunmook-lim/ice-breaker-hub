import 'package:flutter/material.dart';
import 'package:ice_breaker_hub/items/game_items.dart';

void main() {
  runApp(const IcebreakerApp());
}

class IcebreakerApp extends StatelessWidget {
  const IcebreakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (final platform in TargetPlatform.values)
              platform: const FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        fontFamily: 'Waguri',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double titleHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;

          // 제목 제외한 높이
          final double availableHeight = screenHeight - titleHeight;

          // 정사각형 크기 = 가용 너비와 높이 중 작은 값
          final double squareSize =
              screenWidth < availableHeight ? screenWidth : availableHeight;

          return Column(
            children: [
              const SizedBox(
                height: titleHeight,
                child: Center(
                  child: Text(
                    '아이스브레이커 게임',
                    style: TextStyle(
                      fontFamily: 'Waguri',
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),

              // 가운데 정사각형 영역
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: squareSize,
                    height: squareSize,
                    child: GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1,
                      padding: const EdgeInsets.all(8),
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      children: gameItems.map((item) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => item.page),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade300,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            item.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
