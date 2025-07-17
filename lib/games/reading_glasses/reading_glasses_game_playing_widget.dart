import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_breaker_hub/games/reading_glasses/bloc/reading_glasses_bloc.dart';
import 'package:ice_breaker_hub/games/reading_glasses/bloc/reading_glasses_state.dart';

class ReadingGlassesGamePlayingWidget extends StatefulWidget {
  const ReadingGlassesGamePlayingWidget({super.key});

  @override
  State<ReadingGlassesGamePlayingWidget> createState() =>
      _ReadingGlassesGamePlayingWidgetState();
}

class _ReadingGlassesGamePlayingWidgetState
    extends State<ReadingGlassesGamePlayingWidget> {
  int currentIndex = 0;
  Offset pointerPosition = const Offset(-1000, -1000); // 화면 밖 초기화

  void _goToNextImage(List<Uint8List> images) {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
      pointerPosition = const Offset(-1000, -1000); // 마우스 위치 초기화
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('게임 진행 중')),
      body: BlocBuilder<ReadingGlassesBloc, ReadingGlassesState>(
        builder: (context, state) {
          if (state.images.isEmpty) {
            return const Center(child: Text('이미지가 없습니다'));
          }

          final imageBytes = state.images[currentIndex];

          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 🔼 설명 텍스트
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '마우스를 움직여 이미지를 확인하세요!',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  // 🔄 이미지 및 마우스 추적 영역
                  Expanded(
                    child: Center(
                      child: MouseRegion(
                        onHover: (event) {
                          setState(() => pointerPosition = event.localPosition);
                        },
                        onExit: (_) {
                          setState(() =>
                              pointerPosition = const Offset(-1000, -1000));
                        },
                        child: Stack(
                          children: [
                            Image.memory(
                              imageBytes,
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                              fit: BoxFit.contain,
                            ),
                            CustomPaint(
                              size: Size(
                                  constraints.maxWidth, constraints.maxHeight),
                              painter: SpotlightPainter(pointerPosition),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 🔽 다음 이미지 버튼
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () => _goToNextImage(state.images),
                      child: const Text('다음 이미지'),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class SpotlightPainter extends CustomPainter {
  final Offset? position;

  SpotlightPainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    if (position == null) return;

    final overlayPaint = Paint()..color = Colors.black.withOpacity(1.0);

    // 1. 레이어를 저장
    canvas.saveLayer(Offset.zero & size, Paint());

    // 2. 전체 검정색 반투명 덮기
    canvas.drawRect(Offset.zero & size, overlayPaint);

    // 3. 마우스 위치를 원형으로 지우기 (사진 보이게 하기)
    final transparentCirclePaint = Paint()..blendMode = BlendMode.dstOut;

    canvas.drawCircle(position!, 80, transparentCirclePaint);

    // 4. 레이어 복원
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SpotlightPainter oldDelegate) {
    return oldDelegate.position != position;
  }
}
