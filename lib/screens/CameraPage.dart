import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:talan_mobile_interface/screens/VideoPage.dart';

import '../form_components/delayed_animation.dart';


class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras(); // cameras disponibles
    final front = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);// selection de la camera frontale
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize(); // initialiser le controller
    setState(() => _isLoading = false); // changer le statut de isLoading
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      _cameraController.setFlashMode(FlashMode.auto);
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file.path),
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();// commencer l'enregistrement
      setState(() => _isRecording = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(height: 20),
              Center(
                child: Stack(
                    alignment: Alignment.bottomCenter,
                  children: [
                    CameraPreview(_cameraController),
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(_isRecording ? Icons.stop : Icons.circle),
                            onPressed: () => _recordVideo(),
                          ),
                        ),
                      ]
                  ),
              ),

              SizedBox(height: 150),
              DelayedAnimation(
                delay: 500,

                child:Container(

                  margin: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed:() {} ,
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Colors.green

                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed:(){},
                                style:ElevatedButton.styleFrom(shape: StadiumBorder()) ,
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: Colors.white70,
                                ),
                              ),
                              const Center(child: Text("Validation"))
                            ],
                          )
                      ),
                      ElevatedButton(
                          onPressed:() {} ,
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Colors.red
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed:(){
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.thumb_down,
                                  color: Colors.white70,
                                ),
                              ),
                              const Center(child: Text("Decline"))
                            ],
                          )
                      )
                    ],
                  ),
                ),

              ),
            ],
          ),

        // child: Stack(
        //   alignment: Alignment.bottomCenter,
        //   children: [
        //     CameraPreview(_cameraController),
        //     Padding(
        //       padding: const EdgeInsets.all(25),
        //       child: FloatingActionButton(
        //         backgroundColor: Colors.blue,
        //         child: Icon(_isRecording ? Icons.stop : Icons.circle),
        //         onPressed: () => _recordVideo(),
        //       ),
        //     ),
        //   ],
        // ),
      );
    }
  }
}