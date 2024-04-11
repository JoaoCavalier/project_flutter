class listasContas {
  Pageable? _pPageable;
  List<Content>? _lContent;

  listasContas({Pageable? pPageable, List<Content>? lContent}) {
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

  listasContas.fromJson(Map<String, dynamic> json) {
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
  String? _compeCode;
  String? _branchCode;
  String? _number;
  String? _accountId;

  Content(
      {String? compeCode,
      String? branchCode,
      String? number,
      String? accountId}) {
    if (compeCode != null) {
      this._compeCode = compeCode;
    }
    if (branchCode != null) {
      this._branchCode = branchCode;
    }
    if (number != null) {
      this._number = number;
    }
    if (accountId != null) {
      this._accountId = accountId;
    }
  }

  String? get compeCode => _compeCode;
  set compeCode(String? compeCode) => _compeCode = compeCode;
  String? get branchCode => _branchCode;
  set branchCode(String? branchCode) => _branchCode = branchCode;
  String? get number => _number;
  set number(String? number) => _number = number;
  String? get accountId => _accountId;
  set accountId(String? accountId) => _accountId = accountId;

  Content.fromJson(Map<String, dynamic> json) {
    _compeCode = json['compeCode'];
    _branchCode = json['branchCode'];
    _number = json['number'];
    _accountId = json['accountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compeCode'] = this._compeCode;
    data['branchCode'] = this._branchCode;
    data['number'] = this._number;
    data['accountId'] = this._accountId;
    return data;
  }
}
