class Province {
  int? id;
  String? text;
  String? textNp;

  Province({this.id, this.text,this.textNp});

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
