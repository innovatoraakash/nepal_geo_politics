///province or state is top level administrative division in present nepal
class Province {
  int? id;

  ///province name in English
  String? text;

  ///province name in Nepali
  String? textNp;

  Province({this.id, this.text, this.textNp});

  factory Province.fromJson(Map<String, dynamic> json) => Province(
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
