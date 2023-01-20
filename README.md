This Package can be used to Get the administrative level dropdown of Nepal with नेपाली(Nepali) language enabled. you can use either individual level of dropdown or all the level with hierarchical relationship

## Features

- resizable Width of dropdown
- custom labels, TextStyles, InputDecorations, Padding, AlignmentDirection, etc.
- Nepali(नेपाली) language enabled


## Usage
To get all the inter-related administrative areas dropdown just call this widget
```dart
  NepalAdminstrativeArea(),
```
You can use other feature like [ontap], [useNepaliText] etc
```dart
  NepalAdminstrativeArea(
              useNepaliText: true,
              provinceLabel: "state",
              ontap: (value, areatype) {
                debugPrint(value);
                debugPrint(areatype.name);
              },
            ),
```
You can use individual dropdowns like
```dart
   const NepalAdminstrativeArea(
              areaType: AreaType.district,
            ),
```

## Additional information
These resources are collected from difference sources from the internet if you find anything that need to be changed feel free to fork this project or mail me on ghimiresky2@gmail.com
