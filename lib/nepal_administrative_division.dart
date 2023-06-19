library nepal_administrative_division;

import 'package:flutter/material.dart';

import 'enums.dart';
import 'nepal_pdc_model/nepal_json.dart';
import 'nepal_pdc_model/nepal_pdc_model.dart';

int? selectedState;
int? selectedDistrict;
int? selectedArea;

///This class is used to Get the administrative level dropdown of Nepal
///can be used with नेपाली(Nepali) language enabled
///you can use either individual level of dropdown or all the level with hierarchical relationship
///[ontap] can be used to get the selected value of administrative area
class NepalAdminstrativeArea extends StatefulWidget {
  ///[width] of dropdown
  final double? width;

  ///[TextStyle] forall the text like labels,content
  final TextStyle? style;

  ///callback function which has name of the administrative area name as String and
  ///administrative area type as a enum [AreaType] area
  ///This Function mainly helps to get value returned for your use
  final Function(String val, AreaType area)? ontap;
  final InputDecoration? decoration;
  final AreaType areaType;
  final EdgeInsets? contentPadding;

  ///custom label text for [AreaType.district] dropdown
  final String? distrctLabel;

  ///custom label text for [AreaType.province] dropdown
  final String? provinceLabel;

  ///custom label text for [AreaType.localLevel] dropdown
  final String? localAreaLabel;
  final AlignmentDirectional? alignmentDirectional;
  final CrossAxisAlignment? itemsCrossAxisAlignment;

  ///set this as true to set text language to Nepali i.e नेपाली
  final bool useNepaliText;

  ///set the inital value of the province
  final String? provinceInitalValue;

  ///set the inital value of the district
  final String? districtInitalValue;

  ///set the inital value of the local Level
  final String? localLevelInitalValue;

  const NepalAdminstrativeArea(
      {super.key,
      this.areaType = AreaType.all,
      this.width,
      this.style,
      this.contentPadding,
      this.alignmentDirectional,
      this.decoration,
      this.distrctLabel,
      this.provinceLabel,
      this.localAreaLabel,
      this.useNepaliText = false,
      this.ontap,
      this.itemsCrossAxisAlignment,
      this.provinceInitalValue,
      this.districtInitalValue,
      this.localLevelInitalValue});

  @override
  State<NepalAdminstrativeArea> createState() => _NepalAdminstrativeAreaState();
}

class _NepalAdminstrativeAreaState extends State<NepalAdminstrativeArea> {
  final nepalPdc = NepalPdcModel.fromJson(nepalJson);
  late final Function(String val, AreaType area)? ontapMain;
  @override
  void initState() {
    ontapMain = widget.ontap;
    super.initState();
  }

  SizedBox customDropdownField(
      {required List<StringCallback> items,
      String? label,
      String? initalValue,
      Function(String val)? ontap,
      required AreaType areaType}) {
    return SizedBox(
      width: widget.width,
      child: Padding(
        padding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: ClickableDropDown(
          dropdownvalue: items.isNotEmpty
              ? (items.map((e) => e.title).toList().contains(initalValue)
                  ? initalValue
                  : items.first.title)
              : null,
          items: items,
          ontap: (String value) {
            if (ontapMain != null) {
              ontapMain!(value, areaType);
            }
            if (ontap != null) {
              ontap(value);
            }
          },
          alignmentDirectional: widget.alignmentDirectional,
          decoration: widget.decoration ??
              InputDecoration(
                border: const OutlineInputBorder(),
                labelText: label,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String provinceLabel = !widget.useNepaliText ? "Province" : "प्रदेश";
    String districtLabel = !widget.useNepaliText ? "District" : "प्रदेश";
    String areaLabel = !widget.useNepaliText ? "Local Level" : "स्थानीय तह";
    switch (widget.areaType) {
      case AreaType.province:
        return customDropdownField(
            initalValue: widget.provinceInitalValue,
            areaType: widget.areaType,
            label: widget.provinceLabel ?? provinceLabel,
            ontap: (String val) {
              selectedState = nepalPdc.province
                  ?.firstWhere((element) => element.text == val)
                  .id;
              setState(() {});
            },
            items: nepalPdc.province!
                .map((e) => StringCallback(
                    widget.useNepaliText
                        ? e.textNp.toString()
                        : e.text.toString(),
                    () {}))
                .toList());
      case AreaType.district:
        return customDropdownField(
            initalValue: widget.districtInitalValue,
            areaType: widget.areaType,
            ontap: (String val) {
              selectedDistrict = nepalPdc.district
                  ?.firstWhere((element) => element.text == val)
                  .id;
              setState(() {});
            },
            label: widget.distrctLabel ?? districtLabel,
            items: nepalPdc.district!
                .map((e) => StringCallback(
                    widget.useNepaliText
                        ? e.textNp.toString()
                        : e.text.toString(),
                    () {}))
                .toList());
      case AreaType.localLevel:
        return customDropdownField(
            initalValue: widget.localLevelInitalValue,
            areaType: widget.areaType,
            ontap: (String val) {
              selectedArea = nepalPdc.localLevel
                  ?.firstWhere((element) => element.text == val)
                  .id;
              setState(() {});
            },
            label: widget.localAreaLabel ?? areaLabel,
            items: nepalPdc.localLevel!
                .map((e) => StringCallback(
                    widget.useNepaliText
                        ? e.textNp.toString()
                        : e.text.toString(),
                    () {}))
                .toList());
      default:
        return Column(children: [
          customDropdownField(
              initalValue: widget.provinceInitalValue,
              areaType: AreaType.province,
              label: widget.provinceLabel ?? provinceLabel,
              ontap: (String val) {
                if (widget.useNepaliText) {
                  selectedState = nepalPdc.province
                      ?.firstWhere((element) => element.textNp == val)
                      .id;
                } else {
                  selectedState = nepalPdc.province
                      ?.firstWhere((element) => element.text == val)
                      .id;
                }
                setState(() {});
              },
              items: nepalPdc.province!
                  .map((e) => StringCallback(
                      widget.useNepaliText
                          ? e.textNp.toString()
                          : e.text.toString(),
                      () {}))
                  .toList()),

          ///district
          customDropdownField(
              initalValue: widget.districtInitalValue,
              areaType: AreaType.district,
              ontap: (String val) {
                if (widget.useNepaliText) {
                  selectedDistrict = nepalPdc.district
                      ?.firstWhere((element) => element.textNp == val)
                      .id;
                } else {
                  selectedDistrict = nepalPdc.district
                      ?.firstWhere((element) => element.text == val)
                      .id;
                }

                setState(() {});
              },
              label: widget.distrctLabel ?? districtLabel,
              items: nepalPdc.district!
                  .where((element) => element.stateid == selectedState)
                  .map((e) => StringCallback(
                      widget.useNepaliText
                          ? e.textNp.toString()
                          : e.text.toString(),
                      () {}))
                  .toList()),
          customDropdownField(
              initalValue: widget.localLevelInitalValue,
              areaType: AreaType.localLevel,
              ontap: (String val) {
                if (widget.useNepaliText) {
                  selectedArea = nepalPdc.localLevel
                      ?.firstWhere((element) => element.textNp == val)
                      .id;
                } else {
                  selectedArea = nepalPdc.localLevel
                      ?.firstWhere((element) => element.text == val)
                      .id;
                }
              },
              label: widget.localAreaLabel ?? areaLabel,
              items: nepalPdc.localLevel!
                  .where((element) => element.districtid == selectedDistrict)
                  .map((e) => StringCallback(
                          widget.useNepaliText
                              ? e.textNp.toString()
                              : e.text.toString(), () {
                        // ref.read(selectedAreaProvider.notifier).state = e.id!;
                      }))
                  .toList()),
        ]);
    }
  }
}

///Common class of string and a callback function
class StringCallback {
  String title;
  VoidCallback onTap;
  StringCallback(this.title, this.onTap);
}

// ignore: must_be_immutable
class ClickableDropDown extends StatefulWidget {
  String? dropdownvalue;
  final List<StringCallback> items;
  final TextStyle? style;
  final AlignmentDirectional? alignmentDirectional;
  final Function(String val)? ontap;
  final InputDecoration? decoration;
  final CrossAxisAlignment? crossAxisAlignment;

  ClickableDropDown(
      {Key? key,
      this.dropdownvalue,
      required this.items,
      this.style,
      this.ontap,
      this.alignmentDirectional,
      this.crossAxisAlignment,
      this.decoration})
      : super(key: key);

  @override
  State<ClickableDropDown> createState() => _ClickableDropDownState();
}

class _ClickableDropDownState extends State<ClickableDropDown> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: widget.decoration,
      style: widget.style,
      alignment:
          widget.alignmentDirectional ?? AlignmentDirectional.centerStart,
      isExpanded: true,
      value: widget.dropdownvalue ??
          dropdownValue ??
          (widget.items.isNotEmpty ? widget.items.first.title : null),
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: widget.items.map((StringCallback items) {
        return DropdownMenuItem(
          value: items.title,
          onTap: items.onTap,
          child: Column(
            crossAxisAlignment:
                widget.crossAxisAlignment ?? CrossAxisAlignment.start,
            children: [
              Text(items.title),
              const Divider(
                height: 0,
              )
            ],
          ),
        );
      }).toList(),
      selectedItemBuilder: (context) =>
          widget.items.map((StringCallback items) {
        return Text(items.title);
      }).toList(),

      onChanged: (String? newValue) {
        dropdownValue = newValue!;
        widget.dropdownvalue = newValue;
        if (widget.ontap != null) {
          widget.ontap!(newValue);
        }
        setState(() {});
      },
    );
  }
}
