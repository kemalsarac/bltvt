extension CharArrayExtension on List<String> {
  insertAt(int startIndex, String text) {
    for (var c = 0; c < text.length; c++) {
      this[startIndex + c] = text[c];
    }
  }

  insertAdd(String text) {
    for (var c = 0; c < text.length; c++) {
      add(text[c]);
    }
  }
}
