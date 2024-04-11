class saldoConsultas {
  String? _availableAmount;
  String? _blockedAmount;
  String? _automaticallyInvestedAmount;

  saldoConsultas(
      {String? availableAmount,
      String? blockedAmount,
      String? automaticallyInvestedAmount}) {
    if (availableAmount != null) {
      this._availableAmount = availableAmount;
    }
    if (blockedAmount != null) {
      this._blockedAmount = blockedAmount;
    }
    if (automaticallyInvestedAmount != null) {
      this._automaticallyInvestedAmount = automaticallyInvestedAmount;
    }
  }

  String? get availableAmount => _availableAmount;
  set availableAmount(String? availableAmount) =>
      _availableAmount = availableAmount;
  String? get blockedAmount => _blockedAmount;
  set blockedAmount(String? blockedAmount) => _blockedAmount = blockedAmount;
  String? get automaticallyInvestedAmount => _automaticallyInvestedAmount;
  set automaticallyInvestedAmount(String? automaticallyInvestedAmount) =>
      _automaticallyInvestedAmount = automaticallyInvestedAmount;

  saldoConsultas.fromJson(Map<String, dynamic> json) {
    _availableAmount = json['availableAmount'];
    _blockedAmount = json['blockedAmount'];
    _automaticallyInvestedAmount = json['automaticallyInvestedAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availableAmount'] = this._availableAmount;
    data['blockedAmount'] = this._blockedAmount;
    data['automaticallyInvestedAmount'] = this._automaticallyInvestedAmount;
    return data;
  }
}
