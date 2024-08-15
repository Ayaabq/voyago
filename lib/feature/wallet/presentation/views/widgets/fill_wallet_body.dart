// import 'dart:io';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:voyago/constants.dart';
// import 'package:voyago/core/utils/screen_size_util.dart';
// import 'package:voyago/core/utils/styles.dart';
// import 'package:voyago/core/utils/validator_manager.dart';
// import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
// import 'package:voyago/feature/profile/presentation/views/widgets/appbar_profile.dart';
// import 'package:voyago/feature/profile/presentation/views/widgets/profile_textfield.dart';

// import '../../../../../core/utils/assets.dart';
// import '../../../../../core/utils/custom_colors.dart';
// import '../../../../../core/widgets/dialog/dialog_void.dart';

// class FillWalletBody extends StatefulWidget {
//   const FillWalletBody({super.key});

//   @override
//   _FillWalletBodyState createState() => _FillWalletBodyState();
// }

// class _FillWalletBodyState extends State<FillWalletBody> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     _loadImage();
//   }

//   Future<void> _loadImage() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final imagePath = '${directory.path}/bank_deposit_image.png';
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
//           .copy('${directory.path}/bank_deposit_image.png');
//       setState(() {
//         _image = savedImage;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ProfileAppBar(titel: "Fill in my wallet".tr()),
//             const SizedBox(height: 40),
//             const FillCard(),
//             const SizedBox(height: 40),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Enter the amount you want to add:".tr(),
//                     style: Styles.textStyle16W400
//                         .copyWith(fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(height: 10),
//                   TextFieldProfile(
//                       hint: "",
//                       keyboardType: TextInputType.number,
//                       validator: (value) =>
//                           ValidatorManager().validateWallet(value)),
//                   const SizedBox(height: 25),
//                   Row(
//                     children: [
//                       Text(
//                         "Upload the bank deposit picture:".tr(),
//                         style: Styles.textStyle14W400
//                             .copyWith(fontWeight: FontWeight.w500),
//                       ),
//                       const SizedBox(width: 10),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: CustomColors.kMove[5],
//                           foregroundColor: CustomColors.kWhite[0],
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(16)),
//                           ),
//                         ),
//                         onPressed: () async {
//                           showModalBottomSheet(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return SafeArea(
//                                 child: Wrap(
//                                   children: <Widget>[
//                                     ListTile(
//                                       leading: const Icon(Icons.photo_library),
//                                       title: Text("Gallery".tr()),
//                                       onTap: () {
//                                         _pickImage(ImageSource.gallery);
//                                         Navigator.of(context).pop();
//                                       },
//                                     ),
//                                     ListTile(
//                                       leading: const Icon(Icons.photo_camera),
//                                       title: Text("Camera".tr()),
//                                       onTap: () {
//                                         _pickImage(ImageSource.camera);
//                                         Navigator.of(context).pop();
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                         child: const Icon(Icons.file_upload_outlined),
//                       ),
//                     ],
//                   ),
//                   if (_image != null)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Image.file(
//                         _image!,
//                         height: ScreenSizeUtil.screenHeight * 0.2,
//                         width: ScreenSizeUtil.screenHeight * 3,
//                       ),
//                     ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//             SizedBox(height: ScreenSizeUtil.screenHeight * 0.15),
//             Padding(
//               padding: kPaddingHoriz24,
//               child: ButtonAuth(
//                   title: "Submit".tr(),
//                   onTap: () {
//                     showWatingDialog(context);
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//

//test imeges

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:voyago/core/utils/storge_token.dart';
import 'dart:io';

import 'package:voyago/feature/wallet/presentation/manger/fill_wallet/cubit/fill_wallet_cubit.dart';
import 'package:voyago/feature/wallet/presentation/views/widgets/card_fill_wallet.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../auth/login/presentation/views/widgets/button_auth.dart';
import '../../../../profile/presentation/views/widgets/appbar_profile.dart';
import '../../../../profile/presentation/views/widgets/profile_textfield.dart';
import '../../../data/models/fill_wallet_models.dart';

// class FillWalletBody extends StatefulWidget {
//   const FillWalletBody({super.key});

//   @override
//   _FillWalletBodyState createState() => _FillWalletBodyState();
// }

// class _FillWalletBodyState extends State<FillWalletBody> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController _amountController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadImage();
//   }

//   Future<void> _loadImage() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final imagePath = directory.path;
//     if (File(imagePath).existsSync()) {
//       setState(() {
//         _image = File(imagePath);
//         print(_image);
//       });
//     }
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       final directory = await getApplicationDocumentsDirectory();
//       // final savedImage = await File(pickedFile.path)
//       //     .copy('${directory.path}/bank_deposit_image.png');
//       // setState(() {
//       //   _image = savedImage;
//       // });
//     }
//   }

//   void _submit() {
//     if (_image != null && _amountController.text.isNotEmpty) {
//       final requestModel = FillWalletRequestModel(
//         image: _image!,
//         amount: _amountController.text,
//       );
//       context.read<FillWalletCubit>().fillWallet(requestModel);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text("Please select an image and enter the amount"),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ProfileAppBar(titel: "Fill in my wallet".tr()),
//             const SizedBox(height: 40),
//             const FillCard(),
//             const SizedBox(height: 40),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Enter the amount you want to add:".tr(),
//                     style: Styles.textStyle16W400
//                         .copyWith(fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(height: 10),
//                   TextFieldProfile(
//                       hint: "",
//                       controller: _amountController,
//                       keyboardType: TextInputType.number,
//                       validator: (value) =>
//                           ValidatorManager().validateWallet(value)),
//                   const SizedBox(height: 25),
//                   Row(
//                     children: [
//                       Text(
//                         "Upload the bank deposit picture:".tr(),
//                         style: Styles.textStyle14W400
//                             .copyWith(fontWeight: FontWeight.w500),
//                       ),
//                       const SizedBox(width: 10),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: CustomColors.kMove[5],
//                           foregroundColor: CustomColors.kWhite[0],
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(16)),
//                           ),
//                         ),
//                         onPressed: () async {
//                           showModalBottomSheet(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return SafeArea(
//                                 child: Wrap(
//                                   children: <Widget>[
//                                     ListTile(
//                                       leading: const Icon(Icons.photo_library),
//                                       title: Text("Gallery".tr()),
//                                       onTap: () {
//                                         _pickImage(ImageSource.gallery);
//                                         Navigator.of(context).pop();
//                                       },
//                                     ),
//                                     ListTile(
//                                       leading: const Icon(Icons.photo_camera),
//                                       title: Text("Camera".tr()),
//                                       onTap: () {
//                                         _pickImage(ImageSource.camera);
//                                         Navigator.of(context).pop();
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                         child: const Icon(Icons.file_upload_outlined),
//                       ),
//                     ],
//                   ),
//                   if (_image != null)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Image.file(
//                         _image!,
//                         height: ScreenSizeUtil.screenHeight * 0.2,
//                         width: ScreenSizeUtil.screenHeight * 3,
//                       ),
//                     ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//             SizedBox(height: ScreenSizeUtil.screenHeight * 0.15),
//             Padding(
//               padding: kPaddingHoriz24,
//               child: ButtonAuth(
//                 title: "Submit".tr(),
//                 onTap: _submit,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////*************** */
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:io';

// class FillWalletBody extends StatefulWidget {
//   const FillWalletBody({super.key});

//   @override
//   _FillWalletBodyState createState() => _FillWalletBodyState();
// }

// class _FillWalletBodyState extends State<FillWalletBody> {
//   File? _image;
//   final String _token =
//       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoxLCJpYXQiOjE3MjM3NDM3ODcsImV4cCI6MTcyMzc1NDU4N30.j3spNcyxrn65Tpm32SAcb4OqnxrGTyXfaQvr4jxJRb4"; // ضع التوكن الخاص بك هنا
//   final TextEditingController _textController =
//       TextEditingController(); // تحكم النص

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _uploadImage() async {
//     if (_image == null) return;

//     String apiUrl =
//         "http://192.168.1.101:3000/api/charge_wallet"; // استبدل بعنوان ال API الخاص بك

//     try {
//       FormData formData = FormData.fromMap({
//         'image':
//             await MultipartFile.fromFile(_image!.path, filename: "upload.jpg"),
//         'amount': _textController.text, // إضافة الحقل النصي هنا
//       });

//       Dio dio = Dio();
//       dio.options.headers["Authorization"] =
//           "Bearer $_token"; // إضافة التوكن إلى الهيدر

//       Response response = await dio.post(apiUrl, data: formData);

//       if (response.statusCode == 200) {
//         print("Upload successful: ${response.data}");
//       } else {
//         print("Upload failed with status: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error uploading image: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Upload Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? const Text('No image selected.')
//                 : Image.file(_image!),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _textController,
//               decoration: const InputDecoration(
//                 labelText: 'Enter description',
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: const Text('Pick Image'),
//             ),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: const Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/////******** */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FillWalletBody extends StatefulWidget {
  const FillWalletBody({super.key});

  @override
  _FillWalletBodyState createState() => _FillWalletBodyState();
}

class _FillWalletBodyState extends State<FillWalletBody> {
  File? _image;
  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoxLCJpYXQiOjE3MjM3NTY0NjEsImV4cCI6MTcyMzc2NzI2MX0.sgiO0sDOHwhB8HRmft8hnn6ddrIGqn6wQweEb-VJWas";
// ضع التوكن الخاص بك هنا

// ضع التوكن الخاص بك هنا
  final TextEditingController _textController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // حفظ مسار الصورة
      });
    }
  }

  Future<void> uploadImage() async {
    if (_image == null) {
      print("No image selected.");
      return;
    }

    String fileName = _image!.path.split('/').last; // الحصول على اسم الملف
    String extension = fileName.split('.').last.toLowerCase();
    print(extension);
    print(fileName);
// الحصول على الامتداد

    if (['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(extension)) {
      FormData formData = FormData.fromMap({
        'image': MultipartFile.fromFileSync(_image!.path),
        'amount': _textController.text,
      });

      try {
        Dio dio = Dio();
        dio.options.headers["Authorization"] = "Bearer $_token";
        dio.options.headers["Content-Type"] = "multipart/form-data";
// تعيين التوكن هنا
        var response = await dio.post(
            'http://192.168.1.101:3000/api/charge_wallet',
            data: formData);
        print("Response: ${response.data}");
      } catch (e) {
        print("Error uploading image: $e");
      }
    } else {
      print("Invalid file format.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Image")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: _pickImage, child: const Text('Pick Image')),
            ElevatedButton(
              onPressed: uploadImage,
              child: const Text("Upload Image"),
            ),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;

// class FillWalletBody extends StatefulWidget {
//   const FillWalletBody({super.key});

//   @override
//   _FillWalletBodyState createState() => _FillWalletBodyState();
// }

// class _FillWalletBodyState extends State<FillWalletBody> {
//   File? _selectedImage;
//   final _quantityController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   final String _token =
//       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoxLCJpYXQiOjE3MjM3NTY0NjEsImV4cCI6MTcyMzc2NzI2MX0.sgiO0sDOHwhB8HRmft8hnn6ddrIGqn6wQweEb-VJWas"; // ضع التوكن الخاص بك هنا
// //  ; // قم بتعديل التوكن هنا

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       if (_validateImage(pickedFile.path)) {
//         setState(() {
//           _selectedImage = File(pickedFile.path);
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content:
//               Text('Invalid image format. Please select a JPEG or PNG image.'),
//         ));
//       }
//     }
//   }

//   bool _validateImage(String path) {
//     final extension = path.split('.').last.toLowerCase();
//     return extension == 'jpg' || extension == 'jpeg' || extension == 'png';
//   }

//   Future<void> _uploadData() async {
//     if (_selectedImage == null || _quantityController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Please select an image and enter a quantity.'),
//       ));
//       return;
//     }

//     final request = http.MultipartRequest(
//       'POST',
//       Uri.parse('http://192.168.1.101:3000/api/charge_wallet'),
//     );

//     // إضافة التوكن إلى الرؤوس (headers)
//     request.headers['Authorization'] = 'Bearer $_token';

//     request.files
//         .add(await http.MultipartFile.fromPath('image', _selectedImage!.path));
//     request.fields['amount'] = _quantityController.text;

//     final response = await request.send();

//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Upload successful!'),
//       ));
//     } else {
//       print(response.statusCode);
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Upload failed. Please try again.'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Image'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             if (_selectedImage != null)
//               Image.file(_selectedImage!, height: 150),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: const Text('Pick Image'),
//             ),
//             TextField(
//               controller: _quantityController,
//               decoration: const InputDecoration(labelText: 'Enter Quantity'),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadData,
//               child: const Text('Upload'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _quantityController.dispose();
//     super.dispose();
//   }
// }
