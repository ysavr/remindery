Duration calculateTimeDifference({required DateTime? savedDateTime}) {
  if (savedDateTime != null) {
    final now = DateTime.now();
    final difference = now.difference(savedDateTime);
    return difference;
  } else {
    return Duration.zero;
  }
}