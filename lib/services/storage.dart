import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  static Future<List<String>> uploadImagesToCloudStorage({
    required List<File> images,
    required String uuid,
  }) async {
    List<String> imagesUrl = [];
    // Get reference to root of storage
    final storageRootRef = FirebaseStorage.instance.ref().root;

    // Get reference to Product Images folder
    final allImagesFolderRef = storageRootRef.child("productImages");

    // Assign the value of the uuid provided to the method.
    // This uuid will be the name of the folder in which the images for a product will be stored
    // The uuid will also serve as a unique identifier for the product such that
    // when the product is erased from the products database, it can also be obtained
    // from the file store and erased too.
    String productImageId = uuid;
    final productImagesFolder = allImagesFolderRef.child(productImageId);
    // Create a storage reference from our app
    for (int i = 0; i < images.length; i++) {
      try {
        await productImagesFolder.child("$i").putFile(images[i]);
        String url = await productImagesFolder.child("$i").getDownloadURL();
        imagesUrl.add(url);
      } catch (e) {
        log(e.toString());
      }
    }
    return imagesUrl;
  }

// [] Uploads only one image to the file store and returns the url of
// that single image on upload complete.
// Useful for product variants that only have one image
  static Future<String> uploadImageToCloudStorage({
    required File image,
    required String uuid,
  }) async {
    String imageUrl = "";
    // Get reference to root of storage
    final storageRootRef = FirebaseStorage.instance.ref().root;

    // Get reference to Product Images folder
    final allImagesFolderRef = storageRootRef.child("productImages");

    // Assign the value of the uuid provided to the method.
    // This uuid will be the name of the folder in which the images for a product will be stored
    // The uuid will also serve as a unique identifier for the product such that
    // when the product is erased from the products database, it can also be obtained
    // from the file store and erased too.
    String productImageId = uuid;
    final productImagesFolder = allImagesFolderRef.child(productImageId);
    try {
      await productImagesFolder.child("0").putFile(image);
      imageUrl = await productImagesFolder.child("0").getDownloadURL();
    } catch (e) {
      log(e.toString());
    }
    return imageUrl;
  }

  static Future<String> getImageUrl(String id) async {
    return "";
  }

  static Future<List<File>> selectImages({bool? allowMultiple}) async {
    List<File> images = [];
    try {
      var files = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: allowMultiple ?? true,
      );
      if (files != null && files.files.isNotEmpty) {
        for (int i = 0; i < files.files.length; i++) {
          images.add(File(files.files[i].path!));
        }
      }
    } catch (e) {
      log(e.toString());
    }
    log("Selected ${images.length} images");
    return images;
  }
  // void getImages() async {
  //   var result = await selectImages();
  //   if (result.length + images.length < 11) {
  //     images.addAll(result);

  //     if (mounted) {
  //       //Check to see if current widget is still mounted in the widget tree before calling set state so as to avoid memory leaks.
  //       setState(() {});
  //     }
  //     return;
  //   }
  //   showSnackBar(
  //     context,
  //     "You can only add a maximum of 10 product pictures",
  //     ErrorType.warning,
  //   );
  // }
}
