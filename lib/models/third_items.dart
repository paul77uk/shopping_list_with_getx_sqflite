class ThirdItem {
  int id;
  int idItem;
  String name;
  String quantity;
  String note;

  ThirdItem(this.id, this.idItem, this.name, this.quantity, this.note);

  Map<String, dynamic> toMap() {
    return {
      'id': (id == 0) ? null : id,
      'idItem': idItem,
      'name': name,
      'quantity': quantity,
      'note': note
    };
  }
}
