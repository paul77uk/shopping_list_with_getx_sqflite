import 'package:get/get.dart';

import '../models/shopping_list.dart';
import '../util/dbhelper.dart';

class ShoppingListController extends GetxController {
  RxString txtName = ''.obs;
  RxString txtPriority = ''.obs;
  RxList shoppingListObs = List<ShoppingList>().obs;
  Rx shoppingListModel = ShoppingList(0, '', 0).obs;
  // RxInt index = 0.obs;
  RxBool isNew = false.obs;

  DbHelper db = DbHelper();

  deleteShoppingList(int index) {
    db.deleteList(shoppingListObs[index]).then((result) {
      showData();
    });
  }

  Future showData() async {
    await db.openDb();
    shoppingListObs.value = await db.getLists();
  }

  newOrEditShoppingList() {
    // ShoppingList shoppingList;
    if (isNew.value) {
      shoppingListModel.value = ShoppingList(0, '', 0);
    }

    shoppingListModel.value.name = txtName.value;
    shoppingListModel.value.priority = int.parse(txtPriority.value);

    db.insertList(shoppingListModel.value);
    // ShoppingList(0, '', 0);
    // bool saveOrEdit = isNew
    // if (_isNew) {
    //   txtName.text = shoppingList[index].name;
    //   txtPriority.text = list.priority.toString();
    showData();
  }

  // static Controller get to => Get.find();

  // int counter = 0;
  // void incrementCounter() {
  //   counter++;
  //   update(); // use update() to update counter variable on UI when increment be called
  // }
}
