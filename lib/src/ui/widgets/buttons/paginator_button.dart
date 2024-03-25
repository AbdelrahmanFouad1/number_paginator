import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';

class PaginatorButton extends StatelessWidget {
  /// Callback for button press.
  final VoidCallback? onPressed;

  /// The child of the button.
  final Widget child;

  /// Whether the button is currently selected.
  final bool selected;

  /// Creates an instance of [PaginatorButton].
  const PaginatorButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = InheritedNumberPaginator.of(context).config;
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: OutlinedBorder.lerp(
              config.buttonShape ?? const RoundedRectangleBorder(),
              RoundedRectangleBorder(
                side:selected?  BorderSide.none: const BorderSide(
                  color:Color(0xffc3c5c8),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              1,
            ),
            backgroundColor: _backgroundColor(context, selected),
            foregroundColor: selected ? const Color(0xffFFFFFF): const Color(0xff333333),
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            padding: config.buttonPadding,
          ),
          child: child,
        ),
      ),
    );
  }

  Color? _backgroundColor(BuildContext context, bool selected) => selected
      ? (InheritedNumberPaginator.of(context)
              .config
              .buttonSelectedBackgroundColor ??
          const Color(0xff1dbf73))
      : InheritedNumberPaginator.of(context)
          .config
          .buttonUnselectedBackgroundColor;

}
