import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/enums/ad_status.dart';
import 'package:xlo_mobx/models/user.dart';

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

  String? id;
  List? images;
  String? title;
  String? description;
  Category? category;
  Address? address;
  num? price;
  bool hidePhone;
  AdStatus status;
  DateTime? createdAt;
  User? user;
  int views;
}
