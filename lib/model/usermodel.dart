class BankList{
  static const String id = "id";
  static const String phonenumber = "phonenumber";
  static const String name = "name";
  static const String email = "email";
  static const String balance = "balance";
  static const String account = "account";
  static const String ifsc = "ifsc";
  static const String tableName = "Sparkbase";
  static final List<String> values = [id ,name,email,balance,account,ifsc];

}


class Info{
  final int? id;
  final int phonenumber;
  final String name;
  final String email;
  final int balance;
  final int account;
  final String ifsc;



  Info({
    this.id,
    required this.phonenumber,
    required this.name,
    required this.email,
    required this.account,
    required this.balance,
    required this.ifsc,
  });

  Info copy({
    int? id,
    int? phonenumber,
    String? name,
    String? email,
    int? balance,
    int? account,
    String? ifsc,
  }) {
    return Info(id : id?? this.id ,
      phonenumber : phonenumber ?? this.phonenumber,
      name:name ?? this.name,
      email:  email ?? this.email,
      balance:  balance ?? this.balance,
      account:  account ?? this.account,
      ifsc:  ifsc ?? this.ifsc,
    );
  }



  static Info fromJson(Map<String ,Object?> json){
    return Info(id: json[BankList.id] as int? ,
      phonenumber : json[BankList.phonenumber] as int,
      name : json[BankList.name] as String,
      email: json[BankList.email] as String,
      balance : json[BankList.balance] as int,
      account : json[BankList.account] as int,
      ifsc: json[BankList.ifsc] as String,
    );
  }

  Map<String,Object?> toJson() {
    return {
      BankList.id : id,
      BankList.phonenumber : phonenumber,
      BankList.name : name,
      BankList.email : email,
      BankList.balance : balance,
      BankList.account : account,
      BankList.ifsc : ifsc,
    };
  }
}

//  id INTEGER PRIMARY KEY AUTOINCREMENT,
//     pin BOOLEAN NOT NULL,
//     title TEXT NOT NULL,
//     content TEXT NOT NULL,
//     createdTime TEXT NOT NULL
