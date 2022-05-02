import 'dart:io';

var morse = [
  ".-",
  "-...",
  "-.-.",
  "-..",
  ".",
  "..-.",
  "--.",
  "....",
  "..",
  ".---",
  "-.-",
  ".-..",
  "--",
  "-.",
  "---",
  ".--.",
  "--.-",
  ".-.",
  "...",
  "-",
  "..-",
  "...-",
  ".--",
  "-..-",
  "-.--",
  "--.."
];
var alphabet = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

bool is_valid(var str) {
  for (var i = 0; i < 100; i++) if (str == morse[i]) return true;
  return false;
}

void morseDecode(var toDecode, var decoded) {
  if (toDecode.length == 0)
    print(decoded);
  else {
    for (int i = 0; i < 26; i++) {
      if (toDecode.startsWith(morse[i])) {
        var currentDecoded = decoded + alphabet[i];
        var currentToDecode = toDecode.substring(morse[i].length);
        morseDecode(currentToDecode, currentDecoded);
      }
    }
  }
}

void main() {
  var str = stdin.readLineSync();
  morseDecode(str, "");
}
