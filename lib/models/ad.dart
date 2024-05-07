import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/helpers/enums/ad_status.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/federative_unit.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/keys/ad.dart';
import 'package:xlo_mobx/repositories/user.dart';

class Ad {
  Ad({
    this.id,
    this.images,
    this.title,
    this.description,
    this.category,
    this.address,
    this.price,
    this.hidePhone = false,
    this.status = AdStatus.pending,
    this.createdAt,
    this.user,
    this.views = 0,
  });

  Ad.fromParse(ParseObject object) {
    id = object.objectId;
    images = object.get<List>(keyAdImages)?.map((i) => i.url).toList();
    title = object.get<String>(keyAdTitle);
    description = object.get<String>(keyAdDescription);
    category = Category.fromParse(object.get<ParseObject>(keyAdCategory)!);
    address = Address(
      federativeUnit: FederativeUnit(
        initials: object.get<String>(keyAdFederativeUnit),
      ),
      city: City(name: object.get<String>(keyAdCity)),
      postalCode: object.get<String>(keyAdPostalCode) ?? '',
      district: object.get<String>(keyAdDistrict) ?? '',
      street: object.get<String>(keyAdStreet) ?? '',
    );
    price = object.get<num>(keyAdPrice);
    hidePhone = object.get<bool>(keyAdHidePhone);
    status = AdStatus.values[object.get<int>(keyAdStatus) ?? 1];
    createdAt = object.createdAt;
    user = UserRepository().mapParseToUser(object.get<ParseUser>(keyAdOwner)!);
    views = object.get(keyAdViews, defaultValue: 0) ?? 0;
  }

  String? id;
  List? images;
  String? title;
  String? description;
  Category? category;
  Address? address;
  num? price;
  bool? hidePhone;
  AdStatus? status;
  DateTime? createdAt;
  User? user;
  int? views;

  Future<User> getUser(ParseObject object) async {
    return UserRepository().mapParseToUser(object.get<ParseUser>(keyAdOwner) ??
        await ParseUser.currentUser() as ParseUser);
  }

  @override
  String toString() {
    return 'Ad{id: $id, images: $images, title: $title, description: $description, category: $category, address: $address, price: $price, hidePhone: $hidePhone, status: $status, createdAt: $createdAt, user: $user, views: $views}';
  }
}
