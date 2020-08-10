import 'package:get/get.dart';

import '../models/list_items.dart';
import '../models/shopping_list.dart';
import '../util/dbhelper.dart';

class ItemListController extends GetxController {
  RxString txtName = ''.obs;
  RxString txtQuantity = ''.obs;
  RxString txtNote = ''.obs;
  RxList item = List<ListItem>().obs;
  RxInt index = 0.obs;
  Rx shoppingList = ShoppingList(0, '', 0).obs;
  Rx itemModel = ListItem(0, 0, '', '', '').obs;
  RxBool isNew = false.obs;
  // RxInt shoppingListDbId = 0.obs;

  DbHelper db = DbHelper();

  deleteItemList(int index) {
    db.deleteItem(item[index]).then((result) {
      showData();
    });
  }

  Future showData() async {
    // ListItem listItem;
    // listItem = item[index.value];
    await db.openDb();
    item.value = await db.getItems(shoppingList.value.id);
  }

  newOrEditItemList() {
    if (isNew.value) {
      itemModel.value = ListItem(0, shoppingList.value.id, '', '', '');
    }

    itemModel.value.name = txtName.value;
    itemModel.value.quantity = txtQuantity.value;
    itemModel.value.note = txtNote.value;

    db.insertItem(itemModel.value);

    showData();
  }
}
