class PlanDataDom {
  PlanDataDom({
    required this.payload,
  });

  final List<PlanDataDomPayload> payload;

  factory PlanDataDom.fromMap(Map<String, dynamic> json) => PlanDataDom(
        payload: List<PlanDataDomPayload>.from(
            json["payload"].map((x) => PlanDataDomPayload.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "payload": List<dynamic>.from(payload.map((x) => x.toMap())),
      };
}

class PlanDataDomPayload {
  PlanDataDomPayload({
    required this.type,
    required this.payAfterMonth,
    required this.intrestPa,
    required this.maxEligibleAmount,
    required this.perGramRate,
    required this.defaulterInterest,
    required this.cashback,
  });

  final String type;
  final double payAfterMonth;
  final double intrestPa;
  final String maxEligibleAmount;
  final String perGramRate;
  final List<DefaulterInterest> defaulterInterest;
  final double cashback;

  factory PlanDataDomPayload.fromMap(Map<String, dynamic> json) =>
      PlanDataDomPayload(
        type: json["type"],
        payAfterMonth: json["payAfterMonth"],
        intrestPa: json["intrestPA"],
        maxEligibleAmount: json["maxEligibleAmount"],
        perGramRate: json["perGramRate"],
        defaulterInterest: List<DefaulterInterest>.from(
            json["defaulterInterest"].map((x) => DefaulterInterest.fromMap(x))),
        cashback: json["cashback"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "payAfterMonth": payAfterMonth,
        "intrestPA": intrestPa,
        "maxEligibleAmount": maxEligibleAmount,
        "perGramRate": perGramRate,
        "defaulterInterest":
            List<dynamic>.from(defaulterInterest.map((x) => x.toMap())),
        "cashback": cashback,
      };
}

class DefaulterInterest {
  DefaulterInterest({
    required this.days,
    required this.interest,
  });

  final String days;
  final double interest;

  factory DefaulterInterest.fromMap(Map<String, dynamic> json) =>
      DefaulterInterest(
        days: json["days"],
        interest: json["interest"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "days": days,
        "interest": interest,
      };
}

Map<String, dynamic> planData = {
  "payload": [
    {
      "type": "Zero Tension",
      "payAfterMonth": 6.0,
      "intrestPA": 12.0,
      "maxEligibleAmount": "7,00,000.00",
      "perGramRate": "3,667.0",
      "defaulterInterest": [
        {
          "days": "0-30",
          "interest": 0.89,
        },
        {
          "days": "31-60",
          "interest": 1.49,
        },
        {
          "days": "61-180",
          "interest": 1.83,
        }
      ],
      "cashback": 100.0
    },
    {
      "type": "Zero Tension",
      "payAfterMonth": 6.0,
      "intrestPA": 12.0,
      "maxEligibleAmount": "7,00,000.00",
      "perGramRate": "3,667.0",
      "defaulterInterest": [
        {
          "days": "0-30",
          "interest": 0.89,
        },
        {
          "days": "31-60",
          "interest": 1.49,
        },
        {
          "days": "61-180",
          "interest": 1.83,
        }
      ],
      "cashback": 100.0
    }
  ]
};
