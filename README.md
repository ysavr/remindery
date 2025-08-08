# Remindery

A Flutter App

---
### Note
⚠️ Penting! Proyek ini menggunakan FVM (Flutter Version Management) untuk mengelola versi Flutter secara konsisten.
 * Instalasi Fvm https://fvm.app/documentation/getting-started/installation

 * Versi Flutter yang digunakan proyek ini didefinisikan di file `.fvmrc` .
 
 * Pastikan kamu menggunakan FVM agar versi Flutter sesuai dan kompatibel.

## How to use 🚀

Jalan kan script `flutter_task` untuk memudahkan dalam melakukan beberapa command seperti `flutter pub get`, `build_runner`, `build apk`, dsb..

### Membuat script executable
```
chmod +x flutter_task.sh
```

menjalankan executable script
```
./flutter_task.sh
```

### Run script
```
bash flutter_task.sh
```

## How to build 📦

* Develop
```
flutter build apk --debug --flavor development -t lib/main_development.dart
```

* Stag
```
flutter build apk --debug --flavor staging -t lib/main_staging.dart
```

* Production
```
flutter build apk --release --flavor production -t lib/main_production.dart
```

* App Bundle
```
flutter build appbundle --release --flavor production -t lib/main_production.dart
```

* Split per Abi
```
flutter build apk --split-per-abi --release --flavor development -t lib/main_development.dart
```
