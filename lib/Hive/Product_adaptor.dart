import 'package:hive/hive.dart';
import 'package:mechine_test_sample/ModelClass/Product_model.dart';

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0; // Assign a unique typeId for the adapter

  @override
  Product read(BinaryReader reader) {
    return Product(
      id: reader.readInt(),
      title: reader.readString(),
      price: reader.readDouble(),
      description: reader.readString(),
      category: reader.readString(),
      image: reader.readString(),
      rating: Rating(
        rate: reader.readDouble(),
        count: reader.readInt(),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeDouble(obj.price);
    writer.writeString(obj.description);
    writer.writeString(obj.category);
    writer.writeString(obj.image);
    writer.writeDouble(obj.rating.rate);
    writer.writeInt(obj.rating.count);
  }
}
