import 'district.dart';
import 'province.dart';
import 'local_level.dart';
import 'zone.dart';

///This class contains all the available lists of administrative ares of nepal
class NepalPdcModel {
  List<Province>? province;
  List<Zone>? zone;
  List<District>? district;
  List<LocalLevel>? localLevel;

  NepalPdcModel({this.province, this.zone, this.district, this.localLevel});

  factory NepalPdcModel.fromJson(Map<String, dynamic> json) => NepalPdcModel(
        province: (json['province'] as List<dynamic>?)
            ?.map((e) => Province.fromJson(e as Map<String, dynamic>))
            .toList(),
        zone: (json['zone'] as List<dynamic>?)
            ?.map((e) => Zone.fromJson(e as Map<String, dynamic>))
            .toList(),
        district: (json['district'] as List<dynamic>?)
            ?.map((e) => District.fromJson(e as Map<String, dynamic>))
            .toList(),
        localLevel: (json['localLevel'] as List<dynamic>?)
            ?.map((e) => LocalLevel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'province': province?.map((e) => e.toJson()).toList(),
        'zone': zone?.map((e) => e.toJson()).toList(),
        'district': district?.map((e) => e.toJson()).toList(),
        'localLevel': localLevel?.map((e) => e.toJson()).toList(),
      };
}
