import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{
  var dataList = <Map<String,String>>[].obs;
  var filteredDataList = <Map<String,String>>[].obs;
  RxList<bool> selectedRows = <bool>[].obs;

  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDummyData();
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

  void fetchDummyData(){
    selectedRows.assignAll(List.generate(36, (index) => false));
    dataList.addAll(List.generate(
        36, (index) =>{
      'Column1' : 'Data ${index +1} -1',
      'Column2' : 'Data ${index +1} -2',
      'Column3' : 'Data ${index +1} -3',
      'Column4' : 'Data ${index +1} -4',
      'Column5' : 'Data ${index +1} -4',
      'Column6' : 'Data ${index +1} -4',
    }
    ));
    filteredDataList.assignAll(dataList);
  }



}