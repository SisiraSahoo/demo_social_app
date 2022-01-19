// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// class PhotoEditingPage extends StatefulWidget {
//   static const routeName = '/PhotoEditingPage';
//   const PhotoEditingPage({Key? key}) : super(key: key);
//
//   @override
//   _PhotoEditingPageState createState() => _PhotoEditingPageState();
// }
//
// class _PhotoEditingPageState extends State<PhotoEditingPage>  {
//   String? fileName;
//   late File photo;
//   List<Filter> filters = presetFiltersList;
//
//   Future<Null> _cropImage() async {
//     File? croppedFile = await ImageCropper.cropImage(
//         sourcePath: photo.path,
//         aspectRatioPresets: Platform.isAndroid
//             ? [
//           CropAspectRatioPreset.square,
//           CropAspectRatioPreset.ratio3x2,
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.ratio4x3,
//           CropAspectRatioPreset.ratio16x9
//         ]
//             : [
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.square,
//           CropAspectRatioPreset.ratio3x2,
//           CropAspectRatioPreset.ratio4x3,
//           CropAspectRatioPreset.ratio5x3,
//           CropAspectRatioPreset.ratio5x4,
//           CropAspectRatioPreset.ratio7x5,
//           CropAspectRatioPreset.ratio16x9
//         ],
//         androidUiSettings: AndroidUiSettings(
//             activeControlsWidgetColor: Get.theme.primaryColor,
//             toolbarTitle: 'Crop your image',
//             toolbarColor: Get.theme.primaryColor,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         iosUiSettings: IOSUiSettings(
//           title: 'Crop your image',
//         ));
//     if (croppedFile != null) {
//       setState(() {
//         photo = croppedFile;
//       });
//     }
//   }
//
//   Future addFilter(context) async {
//     fileName = basename(photo.path);
//     imageLib.Image? image = imageLib.decodeImage(photo.readAsBytesSync());
//     image = imageLib.copyResize(image!, width: 600);
//     Map imageFileTemp = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => new PhotoFilterSelector(
//           appBarColor: Get.theme.primaryColor,
//           title: Text(
//             "Add Filter",
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//           image: image!,
//           filters: presetFiltersList,
//           filename: fileName!,
//           loader: Center(
//             child: AppProgress(),
//           ),
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//     if (imageFileTemp != null && imageFileTemp.containsKey('image_filtered')) {
//       setState(() {
//         photo = imageFileTemp['image_filtered'];
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     final map = Get.arguments as Map<String, dynamic>?;
//     if (map != null) {
//       photo = map['file'];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               Get.back(result: photo);
//             },
//             icon: Icon(Icons.done),
//           ),
//         ],
//         title: Text("Edit your image"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: Container(
//                   color: Colors.white,
//                   width: double.infinity,
//                   height: 330,
//                   child: Image.file(
//                     photo,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Row(children: [
//                 Expanded(
//                   child: AppPrimaryButton(
//                     child: Text("Crop"),
//                     onPressed: _cropImage,
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: AppPrimaryButton(
//                     child: Text("Filters"),
//                     onPressed: () => addFilter(context),
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
