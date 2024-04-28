import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key, this.currentSearch = ''});

  final String currentSearch;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: currentSearch,
    );

    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[700],
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.clear(),
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              autofocus: true,
              textInputAction: TextInputAction.search,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (text) => Navigator.of(context).pop(text),
            ),
          ),
        ),
      ],
    );
  }
}
