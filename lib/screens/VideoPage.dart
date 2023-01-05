import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer_view.dart';
import 'package:footer/footer.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import '../form_components/delayed_animation.dart';

class VideoPage extends StatefulWidget {
  final String filePath;

  const VideoPage({Key? key, required this.filePath}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();

}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
  _videoPlayerController.dispose();
  super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();//initialiser la video
    await _videoPlayerController.setLooping(true);//lire la video de maniere continue
    await _videoPlayerController.play();//Lancer la video
  }

  bool loading = false;

  // Future<bool> saveFile(String url,String fileName) async{
  //   Directory? directory;
  //   try{
  //     if(Platform.isAndroid){
  //       if(await _requestPermission(Permission.storage)){
  //
  //         directory = await getExternalStorageDirectory();
  //
  //         String newPath = "";
  //
  //         List<String> folders = directory.path.split("/");
  //         for(int x=1;x<folders.length;x++){
  //           String folder = folders[x];
  //           if(folder != "Android"){
  //             newPath += "/"+folder;
  //           }else{
  //             break;
  //           }
  //         }
  //         newPath = newPath+"/RPSApp";
  //         directory = Directory(newPath);
  //         print(directory.path);
  //       }else{
  //         return false;
  //       }
  //     }else{
  //       if(await _requestPermission(Permission.photos)){
  //         directory = await getTemporaryDirectory();
  //       }else{
  //         return false;
  //       }
  //     }
  //     if(!await directory.exists()){
  //       await directory.create(recursive: true);
  //     }
  //     if(await directory.exists()){
  //       File saveFile = File(directory.path+"/$fileName");
  //
  //       if(Platform.isIOS){
  //         await ImageGallerySaver.saveFile(saveFile.path,isReturnPathOfIOS: true);
  //       }
  //       return true;
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  //   return false;
  // }

  Future<bool> requestPermission(Permission permission) async{
    if(await permission.isGranted){
      return true;
    }else{
      var result = await permission.request();
      if(result == PermissionStatus.granted){
        return true;
      }else{
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Retour'),
        elevation: 0,
        backgroundColor: Colors.black26,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.check),
        //     onPressed: () {
        //     print('do something with the file');
        //     },
        //   )
        // ],
      ),
      //extendBodyBehindAppBar: true, //retirer la video derriere appbar
      body: FutureBuilder(
            future: _initVideoPlayer(),
            builder: (context, state) {
              if (state.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    VideoPlayer(_videoPlayerController),
                    Container(
                      width: 300.0,
                      height: 80.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 40,
                        ),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed:() {
                                  setState(() {
                                    loading=true;
                                  });

                                  // bool downloaded =  saveFile('','') as bool;
                                  //
                                  // if(downloaded){
                                  //   print("file Downloaded");
                                  // }else{
                                  //   print("Problem Downloading File");
                                  // }

                                  setState(() {
                                    loading=false;
                                  });
                                } ,
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Colors.green

                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed:(){

                                      },
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
                  ],
                );
              };

            },

          ),



    );


    }
}