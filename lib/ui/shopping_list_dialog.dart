import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shopping_list_controller.dart';

class ShoppingListDialog {
  final ShoppingListController slc = Get.find();

  Widget buildDialog() {
    return AlertDialog(
        title: Obx(
          () => Text(
              (slc.isNew.value) ? 'New shopping list' : 'Edit shopping list'),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        content: SingleChildScrollView(
          child: Column(children: <Widget>[
            TextFormField(
                initialValue: !slc.isNew()
                    ? slc.txtName(slc.shoppingListModel.value.name)
                    : '',
                onChanged: slc.txtName,
                decoration: InputDecoration(hintText: 'Shopping List Name')),
            TextFormField(
              initialValue: !slc.isNew()
                  ? slc.txtPriority(
                      slc.shoppingListModel.value.priority.toString())
                  : '',
              onChanged: slc.txtPriority,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Shopping List Priority (1-3)'),
            ),
            RaisedButton(
              child: Text('Save Shopping List'),
              onPressed: () {
                slc.newOrEditShoppingList();
                Get.back();
                // Navigator.pop(context);
              },
            ),
          ]),
        ));
  }
}
