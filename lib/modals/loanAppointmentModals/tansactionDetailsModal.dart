Map<String, dynamic> tansactionDetails = {
  "payload": [
    {
      "amount": "10,00,000",
      "id": "  FEDR1977433567989",
      "mode": "IMPS",
    },
    {
      "amount": "9,00,000",
      "id": "  FEDR1977433567989",
      "mode": "IMPS",
    },
    {
      "amount": "50,00,000",
      "id": "  FEDR1977433567989",
      "mode": "IMPS",
    }
  ]
};

class TransactionDom {
  TransactionDom({
    required this.payload,
  });

  final List<TransactionDomPayload> payload;

  factory TransactionDom.fromMap(Map<String, dynamic> json) => TransactionDom(
        payload: List<TransactionDomPayload>.from(
            json["payload"].map((x) => TransactionDomPayload.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "payload": List<dynamic>.from(payload.map((x) => x.toMap())),
      };
}

class TransactionDomPayload {
  TransactionDomPayload({
    required this.amount,
    required this.id,
    required this.mode,
  });

  final String amount;
  final String id;
  final String mode;

  factory TransactionDomPayload.fromMap(Map<String, dynamic> json) =>
      TransactionDomPayload(
        amount: json["amount"],
        id: json["id"],
        mode: json["mode"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "id": id,
        "mode": mode,
      };
}
