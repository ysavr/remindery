#!/bin/bash

echo "🧹 Removing FVM from this Flutter project..."

# Delete FVM-related files and folders
rm -rf .fvm
# rm -f .fvmrc
rm -f fvm_config.json

# Remove dart.flutterSdkPath from .vscode/settings.json (if exists)
SETTINGS_FILE=".vscode/settings.json"
if [ -f "$SETTINGS_FILE" ]; then
  echo "🛠️  Cleaning dart.flutterSdkPath from $SETTINGS_FILE..."
  # Remove the dart.flutterSdkPath line
  sed -i '' '/"dart.flutterSdkPath"/d' "$SETTINGS_FILE"

  # Optional: remove trailing commas and empty lines (best-effort)
  sed -i '' '/^\s*$/d' "$SETTINGS_FILE"
fi

echo "✅ FVM files removed."

# Run flutter pub get using global SDK
echo "📦 Running pub get with global Flutter SDK..."
flutter pub get

# Suggest updating Android Studio path
echo ""
echo "💡 Android Studio Users:"
echo "   Make sure to reset the Flutter SDK path to your global Flutter SDK:"
echo "   Android Studio > Preferences > Languages & Frameworks > Flutter"
echo ""

# Check and show Flutter version
echo "🔍 Your current global Flutter version is:"
flutter --version

echo ""
echo "✅ Done. Project is now using your global Flutter SDK."
