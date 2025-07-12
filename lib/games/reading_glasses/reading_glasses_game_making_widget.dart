import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class ReadingGlassesGameMakingWidget extends StatefulWidget {
  ReadingGlassesGameMakingWidget({super.key});

  @override
  State<ReadingGlassesGameMakingWidget> createState() =>
      _ReadingGlassesGameMakingWidgetState();
}

class _ReadingGlassesGameMakingWidgetState
    extends State<ReadingGlassesGameMakingWidget> {
  late DropzoneViewController controller1;
  String message1 = 'Drop something here';
  bool highlighted1 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
          child: Text(
            '게임 만들기',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(
                color: highlighted1 ? Colors.redAccent : Colors.grey,
                width: 3,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: buildZone1(context),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.cloud_upload,
                        size: 48,
                        color: highlighted1 ? Colors.redAccent : Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        message1,
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              highlighted1 ? Colors.redAccent : Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '사진을 여기에 드래그 앤 드롭하세요',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: ElevatedButton(
            onPressed: () {
              // 시작 버튼 눌렀을 때 처리
            },
            child: const Text('시작'),
          ),
        ),
      ],
    );
  }

  Widget buildZone1(BuildContext context) => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.copy,
          cursor: CursorType.grab,
          onCreated: (ctrl) => controller1 = ctrl,
          onLoaded: () => print('Zone 1 loaded'),
          onError: (error) => print('Zone 1 error: $error'),
          onHover: () {
            setState(() => highlighted1 = true);
            print('Zone 1 hovered');
          },
          onLeave: () {
            setState(() => highlighted1 = false);
            print('Zone 1 left');
          },
          onDropFile: (file) async {
            print('Zone 1 drop: ${file.name}');
            setState(() {
              message1 = '${file.name} dropped';
              highlighted1 = false;
            });
            final bytes = await controller1.getFileData(file);
            print('Read bytes with length ${bytes.length}');
            print(bytes.sublist(0, min(bytes.length, 20)));
          },
          onDropString: (s) {
            print('Zone 1 drop: $s');
            setState(() {
              message1 = 'text dropped';
              highlighted1 = false;
            });
            print(s.substring(0, min(s.length, 20)));
          },
          onDropInvalid: (mime) => print('Zone 1 invalid MIME: $mime'),
          onDropFiles: (files) => print('Zone 1 drop multiple: $files'),
          onDropStrings: (strings) => print('Zone 1 drop multiple: $strings'),
        ),
      );
}
