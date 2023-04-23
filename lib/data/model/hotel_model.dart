class HotelModel {
  int? _id;
  String? _name;
  String? _checkIn;
  String? _checkOut;
  String? _city;
  double? _pricePerNight;

  HotelModel(
      {int? id,
        String? name,
        String? checkIn,
        String? checkOut,
        String? city,
        double? pricePerNight}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (checkIn != null) {
      this._checkIn = checkIn;
    }
    if (checkOut != null) {
      this._checkOut = checkOut;
    }
    if (city != null) {
      this._city = city;
    }
    if (pricePerNight != null) {
      this._pricePerNight = pricePerNight;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get checkIn => _checkIn;
  set checkIn(String? checkIn) => _checkIn = checkIn;
  String? get checkOut => _checkOut;
  set checkOut(String? checkOut) => _checkOut = checkOut;
  String? get city => _city;
  set city(String? city) => _city = city;
  double? get pricePerNight => _pricePerNight;
  set pricePerNight(double? pricePerNight) => _pricePerNight = pricePerNight;

   HotelModel.fromJson(Map<String, dynamic> json ) {
    _id = json['id'];
    _name = json['name'];
    _checkIn = json['checkIn'];
    _checkOut = json['checkOut'];
    _city = json['city'];
    _pricePerNight = json['pricePerNight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['checkIn'] = this._checkIn;
    data['checkOut'] = this._checkOut;
    data['city'] = this._city;
    data['pricePerNight'] = this._pricePerNight;
    return data;
  }
}
