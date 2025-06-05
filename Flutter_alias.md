# Flutter Alias Config
Tambahkan perintah dibawah ini pada file `./zshrc` untuk bisa menjalankan `flutter doctor` (tanpa harus `fvm flutter doctor`) pada project 

```
if [ -f "flutter_alias.sh" ]; then
  echo "Loading project aliases..."
  source flutter_alias.sh
fi

cd() {
  builtin cd "$@"
  # Check if flutter_alias.sh exists in current directory
  if [ -f "flutter_alias.sh" ]; then
    echo "Loading project aliases..."
    source flutter_alias.sh
  fi
}
```