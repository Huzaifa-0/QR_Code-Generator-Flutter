import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QRGeneratorPage extends StatefulWidget {
  const QRGeneratorPage({Key? key}) : super(key: key);

  @override
  State<QRGeneratorPage> createState() => _QRGeneratorPageState();
}

class _QRGeneratorPageState extends State<QRGeneratorPage> {
  final _controller = TextEditingController();
  final GlobalKey _globalKey = GlobalKey(debugLabel: 'qr_paint');

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final path = '${tempDir.path}/image.png';
      await File(path).writeAsBytes(pngBytes);

      await Share.shareFiles(
        [path],
        text: 'You access from here',
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RepaintBoundary(
                  key: _globalKey,
                  child: QrImage(
                    data: _controller.text,
                    size: 300,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                buildTextField(context),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: IconButton(
          onPressed: _captureAndSharePng,
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  buildTextField(BuildContext context) => TextField(
        controller: _controller,
        onSubmitted: (_) => setState(() {}),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          hintText: "Enter a text",
          suffixIcon: IconButton(
            onPressed: () => setState(() {}),
            icon: Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
}
