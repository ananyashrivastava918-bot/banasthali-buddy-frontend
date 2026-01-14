Future<List<ItemModel>> getItems() async {
  await Future.delayed(Duration(seconds: 1));
  return dummyList;
}
