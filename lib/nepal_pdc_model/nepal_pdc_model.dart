import 'district.dart';
import 'province.dart';
import 'vdc.dart';
import 'zone.dart';

class NepalPdcModel {
  List<Province>? province;
  List<Zone>? zone;
  List<District>? district;
  List<Vdc>? vdc;

  NepalPdcModel({this.province, this.zone, this.district, this.vdc});

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
        vdc: (json['vdc'] as List<dynamic>?)
            ?.map((e) => Vdc.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'province': province?.map((e) => e.toJson()).toList(),
        'zone': zone?.map((e) => e.toJson()).toList(),
        'district': district?.map((e) => e.toJson()).toList(),
        'vdc': vdc?.map((e) => e.toJson()).toList(),
      };
}
