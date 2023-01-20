class Zone {
  int? id;
  String? text;
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
