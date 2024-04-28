class FederativeUnit {
  FederativeUnit({this.id, this.initials, this.name});

  factory FederativeUnit.fromJson(Map<String, dynamic> json) => FederativeUnit(
        id: json['id'],
        initials: json['sigla'],
        name: json['nome'],
      );

  int? id;
  String? initials;
  String? name;

  @override
  String toString() {
    return 'FederativeUnit{id: $id, initials: $initials, name: $name}';
  }
}
