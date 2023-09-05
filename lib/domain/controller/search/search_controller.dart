import 'package:boat_booking/data/datasource/search/search_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  initialData();
  getSearchData();
  getSearchWithFilterData();
}

class SearchControllerImp extends SearchController {
  SharedService sharedService = Get.find();

  late StatusRequest statusRequest;
  StatusRequest statusRequestTow = StatusRequest.none;

  SearchData searchData = SearchData(Get.find());
  List<YachetDetailsModel> yachetModel = [];
  bool isSearch = false;
  TextEditingController? search;
  @override
  initialData() {}

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  getSearchData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.searchData(search!.text);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        yachetModel.clear();
        List responsedata = response['data'];
        yachetModel
            .addAll(responsedata.map((e) => YachetDetailsModel.fromJson(e)));
      } else {
        // statusRequest = StatusRequest.failure;
        CustomSnackWidget.appErrorSnack(
            Get.context!, "لا يوجد هذا الاسم من فضلك حاول مرة اخري");
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    getSearchData();
    update();
  }

//=========SearchwithFilter====================================
  Rx<RangeValues> currentRangeValues = RangeValues(100, 1000).obs;
  RxString selectedStars = RxString('');
  void saveSelectedStars(String starscount) {
    selectedStars.value = starscount;
    update();
  }

  void updateRangeValues(RangeValues values) {
    currentRangeValues.value = values;
    update();
  }

  List<String> itemsOption = [
    "",
    "كاتاماران ",
    "المراكب الشراعية",
    "اليخوت",
    "زورق آلي",
    "اليخوت الفاخرة"
  ];
  List<String> get items2 => itemsOption.toSet().toList();
  var selectedOption2 = 'اختر نوع الرحلة'.obs;
  int? categoryId = 0;
  void selectCategoryFromDropDown(categoriesName) {
    selectedOption2.value = categoriesName ?? '';
    categoryId = itemsOption.indexOf(selectedOption2.value);

    update();
  }

  @override
  getSearchWithFilterData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.searchWithFilterData(
      search!.text,
      currentRangeValues.value.start.round().toString(),
      currentRangeValues.value.end.round().toString(),
      categoryId.toString(),
      selectedStars.value.toString(),
    );
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Navigator.maybePop(Get.context!);
        yachetModel.clear();
        List responsedata = response['data'];
        yachetModel
            .addAll(responsedata.map((e) => YachetDetailsModel.fromJson(e)));
      } else {
        // statusRequest = StatusRequest.failure;
        CustomSnackWidget.appErrorSnack(
            Get.context!, "لا يوجد هذا الاسم من فضلك حاول مرة اخري");
      }
    }
    update();
  }
}
