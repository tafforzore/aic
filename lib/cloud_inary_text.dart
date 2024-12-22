// import 'dart:async';
// import 'dart:io';
// import 'package:finalaic/generated/locales.g.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:cloudinary/cloudinary.dart';
// import 'package:flutter/foundation.dart';
//
// // Informations de configuration pour Cloudinary
// const String apiKey = '537667729453133';
// const String apiSecret = 'gQxOzRK3xvu8_-vYELISiYXBIPo';
// const String cloudName = 'drlamjbmr';
// const String folder = 'media';
// const String uploadPreset = 'zaklsi74';
//
// final cloudinary = Cloudinary.unsignedConfig(
//   cloudName: cloudName,
// );
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cloudinary Demo',
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.system,
//       darkTheme: ThemeData.dark(),
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Cloudinary Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   bool loading = false;
//   String? errorMessage;
//   String? imagePath;
//   String? uploadedImageUrl;
//
//   // Sélectionner une image depuis la galerie ou l'appareil photo
//   Future<void> pickImage(ImageSource source) async {
//     try {
//       final picker = ImagePicker();
//       final XFile? image = await picker.pickImage(source: source);
//
//       if (image != null) {
//         setState(() {
//           imagePath = image.path;
//         });
//       } else {
//         setState(() {
//           errorMessage = 'Aucune image sélectionnée.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Erreur lors de la sélection de l’image : $e';
//       });
//     }
//   }
//
//   // Téléverser l'image sur Cloudinary
//   Future<void> uploadImage({bool signed = true}) async {
//     if (imagePath == null) {
//       setState(() {
//         errorMessage = 'Veuillez sélectionner une image avant de téléverser.';
//       });
//       return;
//     }
//
//     setState(() {
//       loading = true;
//       errorMessage = null;
//     });
//
//     try {
//       final response = signed
//           ? await cloudinary.upload(
//         file: imagePath!,
//         resourceType: CloudinaryResourceType.image,
//         folder: folder,
//       )
//           : await cloudinary.unsignedUpload(
//         file: imagePath!,
//         resourceType: CloudinaryResourceType.image,
//         folder: folder,
//         uploadPreset: uploadPreset,
//       );
//
//       if (response.isSuccessful) {
//         setState(() {
//           uploadedImageUrl = response.secureUrl;
//         });
//       } else {
//         setState(() {
//           errorMessage = 'Erreur lors de l’upload : ${response.error}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Erreur inattendue : $e';
//       });
//     } finally {
//       setState(() {
//         loading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//              Text(
//               LocaleKeys.select_image.tr,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton.icon(
//               onPressed: () => pickImage(ImageSource.gallery),
//               icon:  Icon(Icons.photo),
//               label:  Text(LocaleKeys.import_from_gallery.tr),
//             ),
//             ElevatedButton.icon(
//               onPressed: () => pickImage(ImageSource.camera),
//               icon: const Icon(Icons.camera_alt),
//               label:  Text(LocaleKeys.import_from_cameras.tr),
//             ),
//             const SizedBox(height: 16.0),
//             if (imagePath != null) ...[
//               Text(
//                 LocaleKeys.selected_image.tr,
//                 style: TextStyle(
//                     fontSize: 16, color: Theme.of(context).primaryColor),
//               ),
//               const SizedBox(height: 8.0),
//               Image.file(
//                 File(imagePath!),
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ],
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: loading ? null : () => uploadImage(signed: false),
//               child: loading
//                   ? const CircularProgressIndicator()
//                   : const Text('Téléverser sur Cloudinary'),
//             ),
//             const SizedBox(height: 16.0),
//             if (uploadedImageUrl != null)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Text(
//                     'URL de l’image téléversée :',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8.0),
//                   SelectableText(
//                     uploadedImageUrl!,
//                     style: const TextStyle(color: Colors.blue),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Image.network(
//                     uploadedImageUrl!,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//             if (errorMessage != null)
//               Text(
//                 errorMessage!,
//                 style: const TextStyle(color: Colors.red),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
