import 'dart:io';

import 'package:admin_fragrance_kw/constants/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class CategoriesController extends GetxController{
  var dataList = <Map<String,String>>[].obs;
  var filteredDataList = <Map<String,dynamic>>[].obs;

  RxList<bool> selectedRows = <bool>[].obs;

  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  TextEditingController searchController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  String? subCategoryController;
  Rx<File?> image = Rx<File?>(null);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
  }

  void sortById(int sortColumnIndex, bool ascending) {
    sortAscending.value = ascending;
    filteredDataList.sort((a,b){
      if(ascending){
        return filteredDataList[0]['Column1'].toString().toLowerCase().compareTo(filteredDataList[0]['Column1'].toString().toLowerCase());
      }
      else{
        return filteredDataList[0]['Column1'].toString().toLowerCase().compareTo(filteredDataList[0]['Column1'].toString().toLowerCase());
      }
    });
    this.sortColumnIndex.value = sortColumnIndex;
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(dataList.where((item) => item['Column1']!.contains(query.toLowerCase())));
  }


  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  //firebase
  Future<void> addCategory() async {
    if (categoryController.text.isEmpty || subCategoryController == null || image.value == null) {
      // Show an error snackbar if any field is missing
      ErrorSnackBar('Error', 'Please fill all fields and select an image');
      return;
    }
    try {
      // Add category data with auto-generated ID
      await firestore.collection('categories').add({
        'category': categoryController.text,
        'sub_category': subCategoryController,
        'image_path': image.value?.path ?? '',
        'created_at': Timestamp.now(),
      });

      // Fetch updated categories list
      await fetchCategories();
    } catch (e) {
      print("Error adding category: $e");
    }
  }

  Future<String> _uploadImageToFirebase(File file) async {
    final storageRef = FirebaseStorage.instance.ref().child('category_images/${file.path.split('/').last}');
    await storageRef.putFile(file);
    return await storageRef.getDownloadURL();
  }


  Future<void> deleteCategory(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('categories').doc(docId).delete();
      SuccessSnackBar('', 'Category deleted successfully!');
      fetchCategories();
    } catch (e) {
      ErrorSnackBar('Error', 'Failed to delete category: $e');
    }
  }



  // Fetch categories from Firestore
  Future<void> fetchCategories() async {
    try {
      final querySnapshot = await firestore.collection('categories').get();
      filteredDataList.value = querySnapshot.docs.map((doc) => {
        'id': doc.id,
        'category': doc['category'] ?? '',
        'sub_category': doc['sub_category'] ?? '',
        'image_path': doc['image_path'] ?? '',
      }).toList();
      update();  // Notify listeners
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

}