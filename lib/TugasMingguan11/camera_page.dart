
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MateriCamera extends StatefulWidget {
  const MateriCamera({super.key});

  @override
  State<MateriCamera> createState() => _MateriCameraState();
}

class _MateriCameraState extends State<MateriCamera> {
  CameraController? controller;

  @override

  void initState(){
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

      final List<CameraDescription> cameras = await availableCameras();

      final firstCamera =  cameras.firstOrNull;
      
      if (firstCamera != null) {
        controller = CameraController(firstCamera, ResolutionPreset.max);

        await controller ?.initialize();

        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Materi Camera',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: 
          controller != null
          ? Stack(
            children: [
              CameraPreview(controller!),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber
                  ),
                  child: IconButton(
                    iconSize: 40,
                    onPressed: (){
                      controller?.takePicture().then((value) 
                      {
                        showDialog(context: context, builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                              ),
                            child: Padding(padding: const EdgeInsets.all(8),
                            child: Image.file(
                              File(value.path),
                            ),
                            ),
                          );
                        });
                      }
                      );
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                ),
              )

            ],
          )
          // ? CameraPreview(controller!)

          : Container(color: Colors.black)
        
      ),
      ) ;
  }
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }
}

