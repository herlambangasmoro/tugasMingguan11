
// import package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class MateriCamera extends StatefulWidget {
//   const MateriCamera({super.key});

//   @override
//   State<MateriCamera> createState() => _MateriCameraState();
// }

// class _MateriCameraState extends State<MateriCamera> {
//   CemeraController? controller;

//   @override

//   void initState(){
//     super.initState();

// sdsfsdf
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       final List<CamerasDesription> cameras = await availableCameras();

//       final firstCamera; cameras.firstOrNull;
//       if (firstCamera != null) {
//         controller = CameraController(firstCamera, ResolutionPreset.max);

//         await controller ?.initialize();

//         setState(() {});
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
        
//       )
//       ) ;
//   }
// }a