///local level area which lies under [district]
class Vdc {
  int? id;

  ///this is used from district class
  int? districtid;

  ///name of the local area
  String? text;

  String? textNp;

  Vdc({this.id, this.districtid, this.text, this.textNp});

  factory Vdc.fromJson(Map<String, dynamic> json) => Vdc(
        id: json['id'] as int?,
        districtid: json['districtid'] as int?,
        text: json['text'] as String?,
        textNp: json['textNP'] as String?
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'districtid': districtid,
        'text': text,
        'textNP': textNp
      };
}
