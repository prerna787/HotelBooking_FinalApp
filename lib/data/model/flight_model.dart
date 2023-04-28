class FlightModel {
  int? _flightId;
  String? _flightName;
  String? _fromCity;
  String? _toCity;
  String? _date;

  FlightModel(
      {int? flightId,
      String? flightName,
      String? fromCity,
      String? toCity,
      String? date}) {
    if (flightId != null) {
      this._flightId = flightId;
    }
    if (flightName != null) {
      this._flightName = flightName;
    }
    if (fromCity != null) {
      this._fromCity = fromCity;
    }
    if (toCity != null) {
      this._toCity = toCity;
    }
    if (date != null) {
      this._date = date;
    }
  }

  int? get flightId => _flightId;
  set flightId(int? flightId) => _flightId = flightId;
  String? get flightName => _flightName;
  set flightName(String? flightName) => _flightName = flightName;
  String? get fromCity => _fromCity;
  set fromCity(String? fromCity) => _fromCity = fromCity;
  String? get toCity => _toCity;
  set toCity(String? toCity) => _toCity = toCity;
  String? get date => _date;
  set date(String? date) => _date = date;

  FlightModel.fromJson(Map<String, dynamic> json) {
    _flightId = json['flightId'];
    _flightName = json['flightName'];
    _fromCity = json['fromCity'];
    _toCity = json['toCity'];
    _date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightId'] = this._flightId;
    data['flightName'] = this._flightName;
    data['fromCity'] = this._fromCity;
    data['toCity'] = this._toCity;
    data['date'] = this._date;
    return data;
  }
}
