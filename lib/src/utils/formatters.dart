class Formatters{

  static String formatTime(String time) {
    var newTime = time?.replaceFirst(r'PT', ' ')?.replaceFirst(r'H', 'h')?.replaceFirst(r'M', 'm')?.replaceFirst(r'S', 's');
    return newTime;
  }

  static String formatPlacing(int placing) {
    var newPlacing = "";
    switch (placing) {
      case 1:
        newPlacing = "1st";
        break;
      case 2:
        newPlacing = "2nd";
        break;
      case 3:
        newPlacing = "3rd";
        break;
      default:
        newPlacing = "--";
        break;
    }
    return newPlacing;
  }
}