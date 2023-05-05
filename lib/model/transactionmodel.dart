class MyTransaction {
  final int id;
  final String senderName;
  final String receiverName;
  final int amount;

  MyTransaction({
    required this.id,
    required this.senderName,
    required this.receiverName,
    required this.amount,
  });

  MyTransaction copyWith({
    int? id,
    String? senderName,
    String? receiverName,
    int? amount,
  }) {
    return MyTransaction(
      id: id ?? this.id,
      senderName: senderName ?? this.senderName,
      receiverName: receiverName ?? this.receiverName,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender_name': senderName,
      'receiver_name': receiverName,
      'amount': amount,
    };
  }

  factory MyTransaction.fromMap(Map<String, dynamic> map) {
    return MyTransaction(
      id: map['id'],
      senderName: map['sender_name'],
      receiverName: map['receiver_name'],
      amount: map['amount'],
    );
  }
}
