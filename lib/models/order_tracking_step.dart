class OrderTrackingStep {
  final String title;
  final String description;
  final String dateTime;
  final bool isCompleted;
  final bool isCurrent;

  const OrderTrackingStep({
    required this.title,
    required this.description,
    required this.dateTime,
    this.isCompleted = false,
    this.isCurrent = false,
  });
}