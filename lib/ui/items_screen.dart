import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/item_list_controller.dart';
import 'list_item_dialog.dart';

class ItemsScreen extends StatelessWidget {
  final ItemListController ilc = Get.find();

  @override
  Widget build(BuildContext context) {
    ilc.showData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ilc.shoppingList.value.name),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: (ilc.item != null) ? ilc.item.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(ilc.item[index].name),
              onDismissed: (direction) {
                String strName = ilc.item[index].name;
                ilc.deleteItemList(index);

                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$strName deleted"),
                  ),
                );
              },
              child: ListTile(
                title: Text(ilc.item[index].name),
                subtitle: Text(
                    'Quantity: ${ilc.item[index].quantity} - Note:  ${ilc.item[index].note}'),
                trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      ilc.itemModel(ilc.item[index]);
                      // if is false uses the itemmodel above at this textTiles index
                      ilc.isNew(false);
                      Get.to(ListItemDialog().buildAlert(
                          // context, ListItem(0, 0, '', '', ''), ilc.isNew(false)),
                          ));
                    }),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // if is true, creates a new ItemModel
          ilc.isNew(true);
          Get.to(ListItemDialog().buildAlert(
              // context, ListItem(0, 0, '', '', ''), ilc.isNew(true)),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
