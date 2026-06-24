import 'package:flutter/material.dart';

class TagsWidget extends StatefulWidget {
  final String label;
  final IconData icon;

  const TagsWidget({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        widget.icon,
        color:  Color(0xFF6D28FF),
        ),
      label: Text(widget.label),
    );
  }
}