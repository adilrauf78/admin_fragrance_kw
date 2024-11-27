import 'dart:io';

import 'package:admin_fragrance_kw/constants/colors.dart';
import 'package:admin_fragrance_kw/view/categories/categories_controller/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewCategory extends StatefulWidget {
  const CreateNewCategory({super.key});

  @override
  State<CreateNewCategory> createState() => _CreateNewCategoryState();
}

class _CreateNewCategoryState extends State<CreateNewCategory> {
  final CategoriesController controller = CategoriesController();
  // File? _image;
  // Future<void> _pickImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_Color,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10),
                  Text('Create Category',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              SizedBox(
                width: 550,
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: AppColors.border_Color
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create New Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextField(
                          controller: controller.categoryController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.category, color: AppColors.black.withOpacity(0.6)),
                            labelText: 'Category',
                            labelStyle: TextStyle(
                              color: AppColors.black.withOpacity(.7),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppColors.subColor.withOpacity(.5),
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.category_outlined, color: AppColors.black.withOpacity(0.6)),
                          labelText: 'Sub Category',
                          labelStyle: TextStyle(
                            color: AppColors.black.withOpacity(.7),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: AppColors.subColor.withOpacity(.5),
                              )
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text("Mobile"),
                            value: "Mobile",
                          ),
                          DropdownMenuItem(
                            child: Text("Laptop"),
                            value: "Laptop",
                          ),
                          DropdownMenuItem(
                            child: Text("Camera"),
                            value: "Camera",
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        onChanged: (value) => controller.subCategoryController = value,
                      ),
                      SizedBox(height: 25),
                      GestureDetector(
                        onTap: ()=>controller.pickImage(),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColors.background_Color,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: controller.image.value != null ?Image.file(
                                controller.image.value!,fit: BoxFit.cover):Icon(Icons.add_a_photo,color: AppColors.black.withOpacity(0.6),size: 50,),
                        ),
                        ),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height:50,
                        child: ElevatedButton(
                          onPressed: () => controller.addCategory(),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: AppColors.blue
                          ),
                          child: Text('Create',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
