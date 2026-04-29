/// Generates a Unicode emoji flag from a 2-letter ISO country code.
/// For example, 'US' returns '🇺🇸'.
String getFlagEmoji(String countryCode) {
  // Ensure the code is 2 uppercase letters
  String code = countryCode.toUpperCase();

  if (code.length != 2) return '🌐'; // Fallback for invalid codes or unknown

  // Calculate the Unicode points for the two letters
  // 0x41 is the ASCII value for 'A'
  // 0x1F1E6 is the Unicode point for the regional indicator symbol 'A'
  int firstLetter = code.codeUnitAt(0) - 0x41 + 0x1F1E6;
  int secondLetter = code.codeUnitAt(1) - 0x41 + 0x1F1E6;

  return String.fromCharCodes([firstLetter, secondLetter]);
}
