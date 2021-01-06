///Store model which store the store data
class StoreModel {
  int status;
  List<Result> result;
  String message;
  String recordCount;

  StoreModel({this.status, this.result, this.message, this.recordCount});

  StoreModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Result'] != null) {
      result = new List<Result>();
      json['Result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
    message = json['Message'];
    recordCount = json['RecordCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.result != null) {
      data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    data['RecordCount'] = this.recordCount;
    return data;
  }
}

class Result {
  String dealID;
  String promoCode;
  String title;
  String image;
  String description;
  String tOC;
  String dealCategoryID;
  String discount;
  String currencySymbol;
  String validityStart;
  String validityEnd;
  String dealType;
  String isFav;
  String memberTier;
  String storeID;
  String storeName;
  String towerNumber;
  String categName;

  Result(
      {this.dealID,
      this.promoCode,
      this.title,
      this.image,
      this.description,
      this.tOC,
      this.dealCategoryID,
      this.discount,
      this.currencySymbol,
      this.validityStart,
      this.validityEnd,
      this.dealType,
      this.isFav,
      this.memberTier,
      this.storeID,
      this.storeName,
      this.towerNumber,
      this.categName});

  Result.fromJson(Map<String, dynamic> json) {
    dealID = json['DealID'];
    promoCode = json['PromoCode'];
    title = json['Title'];
    image = json['Image'];
    description = json['Description'];
    tOC = json['TOC'];
    dealCategoryID = json['DealCategoryID'];
    discount = json['Discount'];
    currencySymbol = json['CurrencySymbol'];
    validityStart = json['ValidityStart'];
    validityEnd = json['ValidityEnd'];
    dealType = json['DealType'];
    isFav = json['isFav'];
    memberTier = json['MemberTier'];
    storeID = json['StoreID'];
    storeName = json['StoreName'];
    towerNumber = json['TowerNumber'];
    categName = json['CategName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DealID'] = this.dealID;
    data['PromoCode'] = this.promoCode;
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['Description'] = this.description;
    data['TOC'] = this.tOC;
    data['DealCategoryID'] = this.dealCategoryID;
    data['Discount'] = this.discount;
    data['CurrencySymbol'] = this.currencySymbol;
    data['ValidityStart'] = this.validityStart;
    data['ValidityEnd'] = this.validityEnd;
    data['DealType'] = this.dealType;
    data['isFav'] = this.isFav;
    data['MemberTier'] = this.memberTier;
    data['StoreID'] = this.storeID;
    data['StoreName'] = this.storeName;
    data['TowerNumber'] = this.towerNumber;
    data['CategName'] = this.categName;
    return data;
  }
}
