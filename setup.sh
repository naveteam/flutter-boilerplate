#! /bin/sh

read -p "[1/6] >> Type the project name: " PROJECT_NAME

echo "[2/6] >> Creating a new project based on naveteam/flutter-boilerplate."
git clone -b main https://github.com/naveteam/flutter-boilerplate $PROJECT_NAME

echo "[3/6] >> Initializing a new git repository."
cd $PROJECT_NAME
rm -rf .git
git init --initial-branch=main
cp .env.example .env

if ! [ -x "$(command -v flutter)" ]; then
  echo "Flutter SDK wasn't found in your PATH."
else
  echo "[4/6] >> Installing dependencies."
  flutter pub get
  echo "[5/6] >> Running code-generation tool."
  flutter pub run build_runner build --delete-conflicting-outputs
  echo "[6/6] >> Checking if there's an update available for all dependencies. Try to update before pushing for the first time."
  flutter pub outdated
fi