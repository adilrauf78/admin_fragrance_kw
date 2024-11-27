import 'package:admin_fragrance_kw/constants/colors.dart';
import 'package:admin_fragrance_kw/responsive/responsive.dart';
import 'package:admin_fragrance_kw/view/categories/categories_controller/categories_controller.dart';
import 'package:admin_fragrance_kw/view/categories/create_new_category.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});


  @override
  Widget build(BuildContext context) {
    final CategoriesController controller = Get.put(CategoriesController());
    final screenHeight = MediaQuery.of(context).size.height;
    final tableHeight = screenHeight - -60;


    return Scaffold(
      backgroundColor: AppColors.background_Color,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(CreateNewCategory());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('Create New Category',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ),
                            if (!Responsive.isMobile(context))
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .3,
                                child: TextField(
                                  controller: controller.searchController,
                                  onChanged: (query) =>
                                      controller.searchQuery(query),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Iconsax.search_normal,
                                        color: AppColors.black.withOpacity(
                                            0.6)),
                                    hintText: 'Search Categories',
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: AppColors.subColor.withOpacity(
                                              .5),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            if (Responsive.isMobile(context))
                              IconButton(
                                icon: Icon(Iconsax.search_normal,
                                    color: AppColors.black.withOpacity(0.6)),
                                onPressed: () {},
                              ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Obx(() {

                          Visibility(visible: false,
                            child: Text(controller.filteredDataList.length
                                .toString()),);
    if (controller.filteredDataList.isEmpty) {
    // Display a loading indicator or a message if data hasn't loaded yet
    return Center(child: CircularProgressIndicator());
    }
                          return SizedBox(
                            height: tableHeight,
                            child: Theme(
                              data: ThemeData(
                                  cardTheme: CardTheme(
                                      color: AppColors.white, elevation: 0)),
                              child: PaginatedDataTable2(
                                columnSpacing: 12,
                                horizontalMargin: 12,
                                minWidth: 786,
                                dividerThickness: 0,
                                dataRowHeight: 56,
                                rowsPerPage: 10,
                                headingRowColor: MaterialStateProperty.all(
                                    AppColors.background_Color),
                                headingTextStyle: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.black
                                ),
                                headingRowDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),

                                // CheckBox Column
                                showCheckboxColumn: true,
                                // PAGINATION

                                showFirstLastButtons: true,
                                onPageChanged: (value) {},
                                renderEmptyRowsInTheEnd: false,
                                onRowsPerPageChanged: (noOfRows) {},

                                // SORTING

                                sortAscending: controller.sortAscending.value,
                                sortArrowAlwaysVisible: true,
                                sortArrowIcon: Icons.line_axis,
                                sortColumnIndex: controller.sortColumnIndex
                                    .value,
                                sortArrowBuilder: (bool ascending,
                                    bool sorted) {
                                  if (sorted) {
                                    return Icon(
                                      ascending ? Iconsax.arrow_up_3 : Iconsax
                                          .arrow_down, size: 16,);
                                  }
                                  else {
                                    return Icon(Iconsax.arrow_up_3, size: 16,);
                                  }
                                },
                                columns: [
                                  DataColumn2(
                                    label: Text('Category'),
                                    onSort: (columnIndex, ascending) =>
                                        controller.sortById(
                                            columnIndex, ascending),
                                    size: ColumnSize.L,
                                  ),
                                  DataColumn(
                                    label: Text('Sub Category'),
                                  ),
                                  DataColumn(
                                    label: Text('Category Id'),
                                    onSort: (columnIndex, ascending) =>
                                        controller.sortById(
                                            columnIndex, ascending),
                                  ),
                                  DataColumn(
                                    label: Text('Action'),
                                  ),
                                ],
                                source: MyData(context),
                              ),
                            ),
                          );
                        },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

class MyData extends DataTableSource{
  final CategoriesController controller = Get.find();
  MyData(this.context);

  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    if (index >= controller.filteredDataList.length || index < 0) return null;
    if (controller.filteredDataList.isEmpty || index >= controller.filteredDataList.length || index < 0) {
      return null;
    }
    final data = controller.filteredDataList[index];
    return DataRow2.byIndex(
        index: index,
        onTap: (){},
        onSelectChanged: (isSelected) {
          controller.selectedRows[index] = isSelected ?? false;
          // Update selected row
          notifyListeners();
        },
        cells: [
          DataCell(
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.background_Color,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                SizedBox(width: 10),
                Text(data['category'] ?? ''),
              ],
            ),
          ),
          DataCell(Text(data['sub_category'] ?? '')),
          DataCell(Text(data['id'] ?? '')),
      DataCell(
          Row(
        children: [
        IconButton(
            onPressed: (){
            },
            icon: Icon(Iconsax.pen_add,size: 24,color: AppColors.blue,)),
          SizedBox(width: 0),
          IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: 280,
                        height: 170,
                        decoration: BoxDecoration(
                            color: AppColors.background_Color,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Delete Item',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('Are you sure you want to delete this items?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.black.withOpacity(.25),
                                              blurRadius: 4
                                          )
                                        ]
                                    ),
                                    child: Center(
                                      child: Text('No',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () => controller.deleteCategory(data['id']),
                                  child: Container(
                                    height: 32,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: AppColors.blue,
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Center(
                                      child: Text('Yes',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Iconsax.trash,size: 24,color: Colors.redAccent,)),
      ],)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.filteredDataList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}
