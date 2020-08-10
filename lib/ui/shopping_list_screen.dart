import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/item_list_controller.dart';
import '../controllers/shopping_list_controller.dart';
import 'items_screen.dart';
import 'shopping_list_dialog.dart';

class ShList extends StatelessWidget {
  final ShoppingListController slc = Get.put(ShoppingListController());
  final ItemListController ilc = Get.put(ItemListController());

  @override
  Widget build(BuildContext context) {
    slc.showData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shopping List'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount:
                (slc.shoppingListObs != null) ? slc.shoppingListObs.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(slc.shoppingListObs[index].id.toString()),
                  onDismissed: (direction) {
                    String strName = slc.shoppingListObs[index].name;
                    slc.deleteShoppingList(index);
                    // slc.shoppingListObs.removeAt(index);
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("$strName deleted")));
                  },
                  child: ListTile(
                      title: Text(slc.shoppingListObs[index].name),
                      leading: CircleAvatar(
                        child: Text(
                            slc.shoppingListObs[index].priority.toString()),
                      ),
                      onTap: () {
                        // passes the ShoppingList(id, name, priority)
                        // of this index ListTile to the ItemController
                        // which will display it using a listviewbuilder
                        // in  the items_screen
                        ilc.shoppingList(slc.shoppingListObs[index]);
                        // ilc.index(ilc.shoppingList[index]);
                        // ilc.shoppingListDbId(slc.shoppingListObs[index].id);
                        Get.to(ItemsScreen());
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          slc.shoppingListModel(slc.shoppingListObs[index]);
                          slc.isNew(false);
                          Get.to(ShoppingListDialog().buildDialog());
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) =>
                          //         ShoppingListDialog().buildDialog(
                          //           context,
                          //         ));
                        },
                      )));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          slc.isNew(true);
          Get.to(
            ShoppingListDialog().buildDialog(
                // context,
                ),
          );
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) => ShoppingListDialog().buildDialog(
          //     context,
          //   ),
          // );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
