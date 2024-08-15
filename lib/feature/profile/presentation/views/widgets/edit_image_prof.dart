// // import 'package:flutter/material.dart';
// // import 'package:iconsax/iconsax.dart';

// // import '../../../../../core/utils/custom_colors.dart';
// // import '../../../../../generated/assets.dart';

// // class ProfilePictureEdit extends StatelessWidget {
// //   const ProfilePictureEdit({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         CircleAvatar(
// //           backgroundColor: CustomColors.kMove[5],
// //           radius: 63,
// //           child: const CircleAvatar(
// //               radius: 60, backgroundImage: AssetImage(Assets.homeDummyOffer)
// //               //'https://via.placeholder.com/150'
// //               ),
// //         ),
// //         Positioned(
// //           bottom: 0,
// //           right: 4,
// //           child: CircleAvatar(
// //             backgroundColor: CustomColors.kMove[6],
// //             radius: 16,
// //             child: Icon(
// //               Iconsax.edit,
// //               color: CustomColors.kWhite[0],
// //               size: 16,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// //7

// // import 'dart:io';

// // import 'package:flutter/material.dart';
// // import 'package:iconsax/iconsax.dart';
// // import 'package:image_picker/image_picker.dart';

// // import '../../../../../core/utils/custom_colors.dart';
// // import '../../../../../generated/assets.dart';

// // import 'package:path_provider/path_provider.dart';

// // class ProfilePictureEdit extends StatefulWidget {
// //   const ProfilePictureEdit({super.key});

// //   @override
// //   _ProfilePictureEditState createState() => _ProfilePictureEditState();
// // }

// // class _ProfilePictureEditState extends State<ProfilePictureEdit> {
// //   File? _image;
// //   final ImagePicker _picker = ImagePicker();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadImage();
// //   }

// //   Future<void> _loadImage() async {
// //     final directory = await getApplicationDocumentsDirectory();
// //     final imagePath = '${directory.path}/profile_image.png';
// //     if (File(imagePath).existsSync()) {
// //       setState(() {
// //         _image = File(imagePath);
// //       });
// //     }
// //   }

// //   Future<void> _pickImage(ImageSource source) async {
// //     final pickedFile = await _picker.pickImage(source: source);
// //     if (pickedFile != null) {
// //       final directory = await getApplicationDocumentsDirectory();
// //       final savedImage = await File(pickedFile.path)
// //           .copy('${directory.path}/profile_image.png');
// //       setState(() {
// //         _image = savedImage;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         CircleAvatar(
// //           backgroundColor: CustomColors.kMove[5],
// //           radius: 63,
// //           child: CircleAvatar(
// //             radius: 60,
// //             backgroundImage: _image != null
// //                 ? FileImage(_image!)
// //                 : const AssetImage(Assets.homeDummyOffer) as ImageProvider,
// //           ),
// //         ),
// //         Positioned(
// //           bottom: 0,
// //           right: 4,
// //           child: GestureDetector(
// //             onTap: () async {
// //               showModalBottomSheet(
// //                 context: context,
// //                 builder: (BuildContext context) {
// //                   return SafeArea(
// //                     child: Wrap(
// //                       children: <Widget>[
// //                         ListTile(
// //                           leading: const Icon(Icons.photo_library),
// //                           title: const Text('Gallery'),
// //                           onTap: () {
// //                             _pickImage(ImageSource.gallery);
// //                             Navigator.of(context).pop();
// //                           },
// //                         ),
// //                         ListTile(
// //                           leading: const Icon(Icons.photo_camera),
// //                           title: const Text('Camera'),
// //                           onTap: () {
// //                             _pickImage(ImageSource.camera);
// //                             Navigator.of(context).pop();
// //                           },
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //             child: CircleAvatar(
// //               backgroundColor: CustomColors.kMove[6],
// //               radius: 16,
// //               child: Icon(
// //                 Iconsax.edit,
// //                 color: CustomColors.kWhite[0],
// //                 size: 16,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// /////*
// library;

// import 'dart:io';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../../../../core/utils/custom_colors.dart';
// import '../../../../../generated/assets.dart';

// class ProfilePictureEdit extends StatefulWidget {
//   const ProfilePictureEdit({super.key});

//   @override
//   _ProfilePictureEditState createState() => _ProfilePictureEditState();
// }

// class _ProfilePictureEditState extends State<ProfilePictureEdit> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     _loadImage();
//   }

//   Future<void> _loadImage() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final imagePath = '${directory.path}/profile_image.png';
//     if (File(imagePath).existsSync()) {
//       setState(() {
//         _image = File(imagePath);
//       });
//     }
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       final directory = await getApplicationDocumentsDirectory();
//       final savedImage = await File(pickedFile.path)
//           .copy('${directory.path}/profile_image.png');
//       setState(() {
//         _image = savedImage;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CircleAvatar(
//           backgroundColor: CustomColors.kMove[5],
//           radius: 63,
//           child: CircleAvatar(
//             radius: 60,
//             backgroundImage: _image != null
//                 ? FileImage(_image!)
//                 : const AssetImage(Assets.homeDummyOffer) as ImageProvider,
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           right: 4,
//           child: GestureDetector(
//             onTap: () async {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return SafeArea(
//                     child: Wrap(
//                       children: <Widget>[
//                         ListTile(
//                           leading: const Icon(Icons.photo_library),
//                           title:  Text("Gallery".tr()),
//                           onTap: () async {
//                             await _pickImage(ImageSource.gallery);
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.photo_camera),
//                           title:  Text("Camera".tr()),
//                           onTap: () async {
//                             await _pickImage(ImageSource.camera);
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//             child: CircleAvatar(
//               backgroundColor: CustomColors.kMove[6],
//               radius: 16,
//               child: Icon(
//                 Iconsax.edit,
//                 color: CustomColors.kWhite[0],
//                 size: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/widgets/dialog/dialog_void.dart';
import '../../../../../generated/assets.dart';
import '../../../imagess/image_cubit.dart';
import '../../../imagess/img_state.dart';

class ProfilePictureEdit extends StatefulWidget {
  const ProfilePictureEdit({super.key});

  @override
  _ProfilePictureEditState createState() => _ProfilePictureEditState();
}

class _ProfilePictureEditState extends State<ProfilePictureEdit> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/profile_image.png';
    if (File(imagePath).existsSync()) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final savedImage = await File(pickedFile.path)
          .copy('${directory.path}/profile_image.png');
      setState(() {
        _image = savedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePictureCubit(),
      child: BlocListener<ProfilePictureCubit, ProfilePictureState>(
        listener: (context, state) {
          if (state is ProfilePictureUploading) {
            // عرض مؤشر الانتظار أثناء رفع الصورة
            showWatingDialog(context);
          } else if (state is ProfilePictureUploaded) {
            // إخفاء مؤشر الانتظار وعرض رسالة النجاح
            Navigator.of(context).pop(); // إغلاق مؤشر الانتظار
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Profile picture uploaded successfully!"),
            ));
          } else if (state is ProfilePictureUploadError) {
            // إخفاء مؤشر الانتظار وعرض رسالة الخطأ
            Navigator.of(context).pop(); // إغلاق مؤشر الانتظار
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          }
        },
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: CustomColors.kMove[5],
              radius: 63,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : const AssetImage(Assets.homeDummyOffer) as ImageProvider,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 4,
              child: GestureDetector(
                onTap: () async {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: Text("Gallery".tr()),
                              onTap: () async {
                                await _pickImage(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_camera),
                              title: Text("Camera".tr()),
                              onTap: () async {
                                await _pickImage(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  backgroundColor: CustomColors.kMove[6],
                  radius: 16,
                  child: Icon(
                    Iconsax.edit,
                    color: CustomColors.kWhite[0],
                    size: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 4,
              child: ElevatedButton(
                onPressed: () {
                  if (_image != null) {
                    context
                        .read<ProfilePictureCubit>()
                        .uploadProfilePicture(_image!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please select an image first"),
                    ));
                  }
                },
                child: const Text("Upload"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
