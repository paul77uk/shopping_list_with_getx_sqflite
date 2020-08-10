import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/item_list_controller.dart';

class ListItemDialog {
  final ItemListController ilc = Get.find();

  Widget buildAlert() {
    return AlertDialog(
      title:
          Text((ilc.isNew.value) ? 'New shopping item' : 'Edit shopping item'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
                initialValue: !ilc.isNew()
                    ? ilc.txtName(ilc.item[ilc.index.value].name)
                    : '',
                onChanged: ilc.txtName,
                decoration: InputDecoration(hintText: 'Item Name')),
            TextFormField(
              initialValue: !ilc.isNew()
                  ? ilc.txtQuantity(ilc.item[ilc.index.value].quantity)
                  : '',
              onChanged: ilc.txtQuantity,
              decoration: InputDecoration(hintText: 'Quantity'),
            ),
            TextFormField(
              initialValue: !ilc.isNew()
                  ? ilc.txtNote(ilc.item[ilc.index.value].note)
                  : '',
              onChanged: ilc.txtNote,
              decoration: InputDecoration(hintText: 'Note'),
            ),
            RaisedButton(
                child: Text('Save Item'),
                onPressed: () {
                  ilc.newOrEditItemList();
                  Get.back();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)))
          ],
        ),
      ),
    );
  }
}
