#! /bin/sh

read -p "Project name: " PROJECT_NAME

echo "[1/4] >> Creating a new project based on naveteam/flutter-boilerplate."
git clone -b main https://github.com/naveteam/flutter-boilerplate $PROJECT_NAME

echo "[2/4] >> Initializing a new git repository."
cd $PROJECT_NAME
rm -rf .git
git init --initial-branch=main

echo $(cat .env.example) >> .env

if [ -x "$(command -v flutter)" ]; then
  echo "Flutter SDK wasn't found in your PATH."
else
  echo "[3/4] >> Installing dependencies."
  flutter pub get
  echo "[4/4] >> Running code-generation tool."
  flutter pub run build_runner build --delete-conflicting-outputs
fi