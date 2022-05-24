import 'package:flutter/material.dart';

enum ButtonState { initial, loading }

class FilledButton extends StatelessWidget {
  const FilledButton({
    Key? key,
    required this.title,
    this.color,
    this.onPressed,
    this.radius,
    this.buttonState = ButtonState.initial,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget title;
  final Color? color;
  final double? radius;
  final ButtonState? buttonState;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed != null
            ? () {
                if (buttonState != ButtonState.loading) onPressed!();
                FocusScope.of(context).requestFocus(FocusNode());
              }
            : null,
        child: buttonState == ButtonState.initial
            ? title
            : const Center(
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(),
                ),
              ),
      );
}

class BorderButton extends StatelessWidget {
  const BorderButton({
    Key? key,
    required this.title,
    this.color,
    this.radius,
    this.onPressed,
    this.borderColor,
    this.buttonState = ButtonState.initial,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget title;
  final Color? color;
  final double? radius;
  final Color? borderColor;
  final ButtonState buttonState;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: borderColor == null ? null : BorderSide(color: borderColor!),
        ),
        onPressed: onPressed != null
            ? () {
                onPressed!();
                FocusScope.of(context).requestFocus(FocusNode());
              }
            : null,
        child: buttonState == ButtonState.initial
            ? title
            : const Center(
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(),
                ),
              ),
      );
}

class TxtButton extends StatelessWidget {
  const TxtButton({
    Key? key,
    required this.title,
    this.color,
    this.onPressed,
    this.radius,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget title;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed != null
            ? () {
                onPressed!();
                FocusScope.of(context).requestFocus(FocusNode());
              }
            : null,
        child: title,
      );
}
