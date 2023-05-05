import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sparkbank/model/usermodel.dart';
import 'package:sparkbank/model/transactionmodel.dart';

class Sparkbank {
  static Database? _database;
  static final Sparkbank instance = Sparkbank._init();


  Sparkbank._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('Sparkbase.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const intType = 'INTEGER';
    const textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE Sparkbase(
      ${BankList.id} $idType,
      ${BankList.phonenumber} $intType,
      ${BankList.name} $textType,
      ${BankList.email} $textType,
      ${BankList.balance} $intType,
      ${BankList.account} $intType,
      ${BankList.ifsc} $textType
      )
    ''');

    await db.execute('''
    CREATE TABLE Transactions (
      id $intType,
      sender_name $textType,
      receiver_name $textType,
      amount $intType
    )
  ''');
  }

  Future<Info?> insertEntry(Info info) async {
    final db = await instance.database;
    final id = await db!.insert(BankList.tableName, info.toJson());
    return info.copy(id: id);
  }

  Future<List<Info>> readAllInfo() async {
    final db = await instance.database;
    const orderBy = '${BankList.id} ASC';
    final queryResult = await db!.query(BankList.tableName, orderBy: orderBy);
    return queryResult.map((json) => Info.fromJson(json)).toList();
  }

  Future<void> deleteInfo(int id) async {
    final db = await instance.database;
    await db!.delete(
      BankList.tableName,
      where: '${BankList.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<String>> getAllNamesExcept(String name) async {
    final db = await Sparkbank.instance.database;
    const orderBy = '${BankList.id} ASC';
    final queryResult = await db!.query(BankList.tableName,
        orderBy: orderBy, where: '${BankList.name} != ?', whereArgs: [name]);
    return queryResult.map((json) => Info.fromJson(json).name).toList();
  }
  ///Transaction Table function.......................................................................................
  Future<MyTransaction?> insertTransaction(MyTransaction transaction) async {
    final db = await instance.database;
    final id = await db!.insert('Transactions', transaction.toMap());
    return transaction.copyWith(id: id);
  }

  Future<List<MyTransaction>> readAllTransactions() async {
    final db = await instance.database;
    final queryResult = await db!.query('Transactions');
    return queryResult.map((json) => MyTransaction.fromMap(json)).toList();
  }


  Future<void> transferAmount(int id, String senderName, String receiverName, int amount) async {
    final db = await instance.database;

    final sender = await db!.query(BankList.tableName,
        where: '${BankList.name} = ?', whereArgs: [senderName]);
    final receiver = await db.query(BankList.tableName,
        where: '${BankList.name} = ?', whereArgs: [receiverName]);

    if (sender.isNotEmpty && receiver.isNotEmpty) {
      final senderBalance = sender.first[BankList.balance] as int;
      final receiverBalance = receiver.first[BankList.balance] as int;

      if (senderBalance >= amount) {
        final newSenderBalance = senderBalance - amount;
        final newReceiverBalance = receiverBalance + amount;

        await db.update(BankList.tableName,
            {BankList.balance: newSenderBalance},
            where: '${BankList.name} = ?', whereArgs: [senderName]);

        await db.update(BankList.tableName,
            {BankList.balance: newReceiverBalance},
            where: '${BankList.name} = ?', whereArgs: [receiverName]);

        await insertTransaction(
            MyTransaction(id: id,senderName: senderName, receiverName: receiverName, amount: amount));
      } else {
        // Insert a transaction with "cancelled" status
        await insertTransaction(MyTransaction(
          id: id,
          senderName: senderName,
          receiverName: "cancelled",
          amount: amount,
        ));
        throw Exception('Insufficient balance');
      }
    } else {
      // Insert a transaction with "cancelled" status
      await insertTransaction(MyTransaction(
        id: id,
        senderName: senderName,
        receiverName: "cancelled",
        amount: amount,
      ));
      throw Exception('Invalid sender or receiver name');
    }
  }

  Future closeDB() async {
    final db = await instance.database;
    db!.close();
  }
}



