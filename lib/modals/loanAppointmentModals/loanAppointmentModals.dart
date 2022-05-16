Map<String, dynamic> getOtp = {
  "otp": 0000,
};

Map<String, dynamic> jewelsDetails = {
  "payload": [
    {
      "type": "Necklace",
      "image": "assets/images/necklace1.png",
      "quantity": 02.0,
      "quality": 22.0,
      "grossWeight": 150.0,
      "stoneWeight": 30.0,
      "netWeight": 4.0,
    },
    {
      "type": "Necklace",
      "image": "assets/images/necklace1.png",
      "quantity": 02.0,
      "quality": 22.0,
      "grossWeight": 150.0,
      "stoneWeight": 30.0,
      "netWeight": 4.0,
    },
  ]
};

class JewelDom {
  JewelDom({
    required this.payload,
  });

  final List<JewelDomPayload> payload;

  factory JewelDom.fromMap(Map<String, dynamic> json) => JewelDom(
        payload: List<JewelDomPayload>.from(
            json["payload"].map((x) => JewelDomPayload.fromMap(x))),
      );
}

class JewelDomPayload {
  JewelDomPayload({
    required this.type,
    required this.image,
    required this.quantity,
    required this.quality,
    required this.grossWeight,
    required this.stoneWeight,
    required this.netWeight,
  });

  final String type;
  final String image;
  final double quantity;
  final double quality;
  final double grossWeight;
  final double stoneWeight;
  final double netWeight;

  factory JewelDomPayload.fromMap(Map<String, dynamic> json) => JewelDomPayload(
        type: json["type"],
        image: json["image"],
        quantity: json["quantity"],
        quality: json["quality"],
        grossWeight: json["grossWeight"],
        stoneWeight: json["stoneWeight"],
        netWeight: json["netWeight"],
      );
}
