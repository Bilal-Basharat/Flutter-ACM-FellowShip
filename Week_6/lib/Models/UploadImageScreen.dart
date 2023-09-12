import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

        if(pickedFile != null){
          image = File(pickedFile!.path);
          setState(() {

          });
        }else{
          print('no image selected');
        }
  }

  Future uploadImage() async{
    setState(() {
      showSpinner = true;
    });
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();
    
    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = new http.MultipartRequest('POST',uri);
    request.fields['title'] = "image title";

    var multipart = new http.MultipartFile(
        'image',
        stream,
        length);

    request.files.add(multipart);
    var response = await request.send();

    print(response.stream.toString());

    if(response.statusCode == 200){
      setState(() {
        showSpinner = false;
      });
      print('Image uploaded successfully');
    }else{
      setState(() {
        showSpinner = false;
      });
      print('failed to upload image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              getImage();
            },
            child: Container(
              child: image == null ? Center(
        child: Text('Pick Image'), ):
            Container(
            child: Center(
              child: Image.file(
                  File(image!.path).absolute,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
              ),
            ),
            )
            ),
          ),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              uploadImage();
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.green,
              child: Center(child: Text('Upload Image',
                style: TextStyle(
                    color:Colors.white, fontWeight: FontWeight.bold, fontSize: 18 ),)),
            ),
          ),
        ],
      ),
    );
  }
}
