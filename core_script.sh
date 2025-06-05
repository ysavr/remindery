echo "Welcome to Savrix core:"
echo
echo "[1] flutter pub get"
echo "[2] build runner"
echo "[3] build runner --delete-conflicting-outputs"
echo "[4] build release apk develop"
echo "[5] build release apk staging"
echo "[6] build release apk production"
echo "[7] build launcher icon"

read -p "Run: " selection

case $selection in

    1)
    echo "Run flutter pub get"
    flutter pub get
    ;;

    2)
    echo "build_runner"
    dart run build_runner build
    ;;
    
    3)
    echo "build_runner"
    dart run build_runner build --delete-conflicting-outputs
    ;;

    4)
    echo "build_apk_develop"
    flutter build apk --debug --flavor develop -t lib/main_development.dart --obfuscate --split-debug-info=build/app/symbols
    ;;

    5)
    echo "build_apk_staging"
    flutter build apk --release --flavor staging -t lib/main_staging.dart --obfuscate --split-debug-info=build/app/symbols
    ;;

    6)
    echo "build_apk_production"
    flutter build apk --release --flavor production -t lib/main_production.dart --obfuscate --split-debug-info=build/app/symbols
    ;;

    7)
    echo "build_launcher_icon"
    dart run flutter_launcher_icons
    ;;
esac