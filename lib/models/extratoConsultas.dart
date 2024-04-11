class extratoConsultas {
  Pageable? _pPageable;
  List<Content>? _lContent;

  extratoConsultas({Pageable? pPageable, List<Content>? lContent}) {
    if (pPageable != null) {
      this._pPageable = pPageable;
    }
    if (lContent != null) {
      this._lContent = lContent;
    }
  }

  Pageable? get pPageable => _pPageable;
  set pPageable(Pageable? pPageable) => _pPageable = pPageable;
  List<Content>? get lContent => _lContent;
  set lContent(List<Content>? lContent) => _lContent = lContent;

  extratoConsultas.fromJson(Map<String, dynamic> json) {
    _pPageable = json['_pageable'] != null
        ? new Pageable.fromJson(json['_pageable'])
        : null;
    if (json['_content'] != null) {
      _lContent = <Content>[];
      json['_content'].forEach((v) {
        _lContent!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._pPageable != null) {
      data['_pageable'] = this._pPageable!.toJson();
    }
    if (this._lContent != null) {
      data['_content'] = this._lContent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pageable {
  String? _totalPages;
  String? _totalRecords;

  Pageable({String? totalPages, String? totalRecords}) {
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
    if (totalRecords != null) {
      this._totalRecords = totalRecords;
    }
  }

  String? get totalPages => _totalPages;
  set totalPages(String? totalPages) => _totalPages = totalPages;
  String? get totalRecords => _totalRecords;
  set totalRecords(String? totalRecords) => _totalRecords = totalRecords;

  Pageable.fromJson(Map<String, dynamic> json) {
    _totalPages = json['totalPages'];
    _totalRecords = json['totalRecords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPages'] = this._totalPages;
    data['totalRecords'] = this._totalRecords;
    return data;
  }
}

class Content {
  String? _creditDebitType;
  String? _transactionName;
  String? _historicComplement;
  double? _amount;
  String? _transactionDate;

  Content(
      {String? creditDebitType,
      String? transactionName,
      String? historicComplement,
      double? amount,
      String? transactionDate}) {
    if (creditDebitType != null) {
      this._creditDebitType = creditDebitType;
    }
    if (transactionName != null) {
      this._transactionName = transactionName;
    }
    if (historicComplement != null) {
      this._historicComplement = historicComplement;
    }
    if (amount != null) {
      this._amount = amount;
    }
    if (transactionDate != null) {
      this._transactionDate = transactionDate;
    }
  }

  String? get creditDebitType => _creditDebitType;
  set creditDebitType(String? creditDebitType) =>
      _creditDebitType = creditDebitType;
  String? get transactionName => _transactionName;
  set transactionName(String? transactionName) =>
      _transactionName = transactionName;
  String? get historicComplement => _historicComplement;
  set historicComplement(String? historicComplement) =>
      _historicComplement = historicComplement;
  double? get amount => _amount;
  set amount(double? amount) => _amount = amount;
  String? get transactionDate => _transactionDate;
  set transactionDate(String? transactionDate) =>
      _transactionDate = transactionDate;

  Content.fromJson(Map<String, dynamic> json) {
    _creditDebitType = json['creditDebitType'];
    _transactionName = json['transactionName'];
    _historicComplement = json['historicComplement'];
    _amount = json['amount'];
    _transactionDate = json['transactionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creditDebitType'] = this._creditDebitType;
    data['transactionName'] = this._transactionName;
    data['historicComplement'] = this._historicComplement;
    data['amount'] = this._amount;
    data['transactionDate'] = this._transactionDate;
    return data;
  }
}
