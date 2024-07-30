class categoryModel{
  String id;
  String Name;
  String Image;
  categoryModel(this.id,this.Name,this.Image);
}

class subCategoryModel{
  String id;
  String Name;
  String Image;
  subCategoryModel(this.id,this.Name,this.Image);
}

class ItemModel{
  String id;
  String Name;
  String Description;
  String Price;
  String Image;
  ItemModel(this.id,this.Name,this.Description,this.Price,this.Image);
 }

 class CartModel{
  String id;
  String Name;
  String Price;
  String Image;
  String itemId;
  CartModel(this.id,this.Name,this.Price,this.Image,this.itemId);

 }