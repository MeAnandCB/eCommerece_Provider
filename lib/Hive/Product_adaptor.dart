import 'package:hive/hive.dart';
import 'package:mechine_test_sample/ModelClass/Product_model.dart';

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    return Product(
      id: reader.readInt(),
      title: reader.readString(),
      image: reader.readString(),
      price: reader.readDouble(),
      category: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.image);
    writer.writeDouble(obj.price);
    writer.writeString(obj.category);
  }
}
