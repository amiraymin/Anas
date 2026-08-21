# Flutter Grocery App - Shop Screen Demo

This Flutter project contains a small grocery UI demonstrating common mobile app patterns.

## Screenshot

![Shop Screen](assets/imges/slider.png)

> Place the provided shop screen image at `assets/imges/shop_screen.png` to show the UI above.

## Proof of Learning

- **Bottom navigation bar:** implemented with `BottomNavigationBar` to switch between `Shop`, `Explore`, `Cart`, `Favorite`, and `Account` pages.
- **Adding items & switching:** each tab is an item in the navigation bar; tapping updates the selected index and switches content using conditional rendering or a `IndexedStack`.
- **Unbordered TextFormField:** used an `InputDecoration` with `border: InputBorder.none` (or `enabledBorder: InputBorder.none`) to create an unbordered search field inside the app bar or top area.

## How to reproduce

1. Add the screenshot file to `assets/imges/shop_screen.png`.
2. Ensure `pubspec.yaml` includes the `assets/imges/` folder under `flutter.assets`.
3. Run the app with `flutter run` to view the shop screen and test the bottom navigation and search field.

## Built With

- Flutter
- Dart

## Notes

This repository focuses on UI patterns (navigation, forms, and layout). It doesn't include backend services or persistent storage.
