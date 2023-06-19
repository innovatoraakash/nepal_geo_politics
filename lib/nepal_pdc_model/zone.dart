///there are 14 zones which contains the district
class Zone {
  int? id;

  ///name of zone in English
  String? text;

  ///name of zone in Nepali
  String? textNp;

  Zone({this.id, this.text, this.textNp});

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json['id'] as int?,
        text: json['text'] as String?,
        textNp: json['textNP'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'textNP': textNp,
      };
}
