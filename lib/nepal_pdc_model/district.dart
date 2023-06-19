///2nd level of administrative area in Nepal
///lies under [Province] or [Zone]
class District {
  int? id;
  int? zoneid;
  int? stateid;

  ///Name of [District] in English
  String? text;

  ///Name of [District] in Nepali
  String? textNp;

  District({this.id, this.zoneid, this.stateid, this.text, this.textNp});

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json['id'] as int?,
        zoneid: json['zoneid'] as int?,
        stateid: json['stateid'] as int?,
        text: json['text'] as String?,
        textNp: json['textNP'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'zoneid': zoneid,
        'stateid': stateid,
        'text': text,
        'textNP': textNp,
      };
}
