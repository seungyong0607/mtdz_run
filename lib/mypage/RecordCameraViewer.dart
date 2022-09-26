import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mtdz_run/mypage/RecordPreviewScreen.dart';
import 'package:flutter/cupertino.dart';

class RecordCameraViewer extends StatefulWidget {
  const RecordCameraViewer({super.key});

  @override
  State<RecordCameraViewer> createState() => _RecordCameraViewerState();
}

class _RecordCameraViewerState extends State<RecordCameraViewer> {
  CameraController? cameraController;
  List? cameras;
  int? selectedCameraIndex;

  @override
  void initState() {
    availableCameras().then((value) {
      cameras = value;

      if (cameras!.length > 0) {
        selectedCameraIndex = 0;

        cameraController = CameraController(
            cameras![selectedCameraIndex!], ResolutionPreset.medium);

        initCamera(cameras![selectedCameraIndex!]).then((_) {});
      } else {
        print("camera error");
      }

      // TODO: implement initState
      super.initState();
    }).catchError((e) {
      // print(e);
    });
  }

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController!.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController!.value.hasError) {
      print('camera error');
    }

    try {
      await cameraController!.initialize();
    } catch (e) {
      print("error $e");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'MTDZ social',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: cameraPreview(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _cameraToggle(),
                      _cameraControl(context),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '32 km',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '15m 23s',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '3256 steps',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cameraPreview() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Text(
        "Loading",
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }

    return CameraPreview(cameraController!);
    // return Container(
    //   child: CameraPreview(cameraController!),
    // );
    // return AspectRatio(
    //   aspectRatio: cameraController!.value.aspectRatio,
    //   child: CameraPreview(cameraController!),
    // );
  }

  Widget _cameraToggle() {
    if (cameras == null || cameras!.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras![selectedCameraIndex!];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: ElevatedButton.icon(
          onPressed: () {
            onSwitchCamera();
          },
          icon: Icon(
            getCameraLensIcon(lensDirection),
            color: Colors.white,
            size: 24,
          ),
          label: Text('change'),
        ),
      ),
    );
  }

  getCameraLensIcon(lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      default:
        return Icons.device_unknown;
    }
  }

  onSwitchCamera() {
    selectedCameraIndex = selectedCameraIndex! < cameras!.length - 1
        ? selectedCameraIndex! + 1
        : 0;

    CameraDescription selectedCamera = cameras![selectedCameraIndex!];
    // initCamera(cameras![selectedCameraIndex!]).then((_) {});
    initCamera(selectedCamera);
  }

  Widget _cameraControl(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              child: const Icon(
                Icons.camera,
                color: Colors.white,
              ),
              onPressed: () {
                onCapture(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  onCapture(context) async {
    try {
      final imgPath = await cameraController!.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RecordPreviewScreen(
            imgPath: imgPath,
            // imgPath: imgPath,
          ),
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}
