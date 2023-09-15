extension StringExtension on String {
  String getInitials() {
    List<String> names = split(" ");
    String initials = "";
    int numWords = 2;

    if (numWords < names.length) {
      numWords = names.length;
    }

    if (names.first.isNotEmpty) {
      initials += '${names.first[0]}';
    }
    if (names.last.isNotEmpty) {
      initials += '${names.last[0]}';
    }

    return initials;
  }
}