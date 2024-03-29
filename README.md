# :rocket: Flutter Boilerplate

## :star: Packages already configured

- [Dio](https://pub.dev/packages/dio)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)
- [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)
- [Provider](https://pub.dev/packages/provider)
- [Flutter DotEnv](https://pub.dev/packages/flutter_dotenv)
- [Equatable](https://pub.dev/packages/equatable)
- [Json Annotation](https://pub.dev/packages/json_annotation)

## :fire: Starting a new project

```sh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/naveteam/flutter-boilerplate/main/setup.sh)"
```

## :wrench: Usage

1. Install all dependencies

```sh
$ flutter pub get
```

2. Create .env file at the root with key:value pairs corresponding to `.env.example`

> It's a required step since we use code-generation tool to generate helper classes for environment variables.

3. Run code-generation tool

```sh
$ flutter pub run build_runner build
```

4. Start coding :smile:

### :raised_hand: Wait a minute

1. You can check if there's an update available for all dependencies running `flutter pub outdated`. You also can update with `flutter pub upgrade` or `flutter pub upgrade --major-versions`. Check if it doesn't have any huge breakchange before upgrading with `--major-versions` argument.

2. It's possible to modify the application dart package name. You only have to edit the `name` property at `pubspec.yaml`, replace all imports with `package:flutter_boilerplate` to `package:[your-package-name]` and download all dependencies with `flutter pub get` again. **You must** follow the [dart guidelines](https://dart.dev/tools/pub/pubspec#name) for the package name or it will fail.
3. If you want to use a [State Management Library](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options) alternative to `ChangeNotifier + Provider`, run `flutter pub remove provider`, install what you need with `flutter pub add [package_name]` and refactor all view models to match with the library of your choice.

## :computer: Code Pattern

TBD
