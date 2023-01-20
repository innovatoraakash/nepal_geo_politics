class Vdc {
  int? id;
  int? districtid;
  String? text;

  Vdc({this.id, this.districtid, this.text});

  factory Vdc.fromJson(Map<String, dynamic> json) => Vdc(
        id: json['id'] as int?,
        districtid: json['districtid'] as int?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'districtid': districtid,
        'text': text,
      };
}
