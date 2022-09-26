import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mtdz_run/mypage/RecordTextCard.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class RecordPreviewScreen extends StatefulWidget {
  const RecordPreviewScreen({
    super.key,
    required this.imgPath,
  });
  final XFile imgPath;
  // final String imgPath;

  @override
  State<RecordPreviewScreen> createState() => _RecordPreviewScreenState();
}

class _RecordPreviewScreenState extends State<RecordPreviewScreen> {
  final _screenShotController = ScreenshotController();
  late int test = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Screenshot(
        controller: _screenShotController,
        child: Stack(
          children: [
            Align(
              child: Expanded(
                child: Image.file(
                  File(widget.imgPath.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                width: test == 0 ? 0 : double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _takeAgain(context),
                    _snsShare(context, testChange),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 130,
              child: RecordTextCard(),
            ),
          ],
        ),
      ),
    );
  }

  testChange() {
    setState(() {
      test = 0;
    });
  }

  _takeAgain(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.camera,
          color: Colors.white,
          size: 24,
        ),
        label: Text('again'),
      ),
    );
  }

  _snsShare(context, testChange) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton.icon(
        onPressed: () async {
          testChange();
          // Navigator.pop(context);
          const _shareText = 'シェアするテキスト';
          final _screenshot = await _screenShotController.capture(
              delay: const Duration(milliseconds: 10));

          if (_screenshot != null) {
            // スクリーンショットをドキュメントディレクトリに保存
            final _documentDirectoryPath =
                await getApplicationDocumentsDirectory();
            final imagePath =
                await File('${_documentDirectoryPath.path}/screenshot.png')
                    .create();
            await imagePath.writeAsBytes(_screenshot);
            // スクリーンショットとテキストをシェア
            await Share.shareFiles([imagePath.path], text: _shareText);
          }
        },
        icon: Icon(
          Icons.social_distance,
          color: Colors.white,
          size: 24,
        ),
        label: Text('sns share'),
      ),
    );
  }
}
