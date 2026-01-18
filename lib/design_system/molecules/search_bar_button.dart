import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/design_system/theme/app_theme_extension.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({
    super.key,
    required this.hintText,
    required this.onTap,
  });

  final String hintText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extension = theme.extension<AppThemeExtension>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: extension?.searchBackground ?? Colors.white,
          foregroundColor: extension?.searchForeground ?? Colors.black54,
        ),
        child: Row(
          children: <Widget>[
            Icon(Icons.search,
                color: extension?.searchForeground ?? Colors.grey),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                hintText,
                style: TextStyle(
                  color: extension?.searchForeground ?? Colors.grey,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
