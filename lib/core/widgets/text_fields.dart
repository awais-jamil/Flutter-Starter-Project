import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mobile_app/utills/app_colors.dart';
import 'package:mobile_app/utills/common_barrel.dart';
import 'package:mobile_app/utills/constants.dart';

class TextFieldWithoutLabel extends StatefulWidget {
  const TextFieldWithoutLabel({
    Key? key,
    required this.hint,
    this.suffix,
    this.prefix,
    this.controller,
    this.validator,
    this.obscure = false,
    this.passwordComplexityIndicator = false,
    this.readOnly = false,
    this.underLineBorder = false,
    this.maxLength,
    this.inputFormatters,
  }) : super(key: key);

  final String hint;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool readOnly;
  final bool underLineBorder;
  final bool passwordComplexityIndicator;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<TextFieldWithoutLabel> createState() => _TextFieldWithoutLabelState();
}

class _TextFieldWithoutLabelState extends State<TextFieldWithoutLabel> {
  bool _passwordRegexMatched = false;
  @override
  Widget build(BuildContext context) => TextFormField(
        textAlignVertical: TextAlignVertical.center,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          errorMaxLines: 2,
          isDense: true,
          border: widget.passwordComplexityIndicator && _passwordRegexMatched
              ? _outlineGreendBorder
              : widget.underLineBorder
                  ? _underLineBorder
                  : _outlineBorder,
          enabledBorder:
              widget.passwordComplexityIndicator && _passwordRegexMatched
                  ? _outlineGreendBorder
                  : widget.underLineBorder
                      ? _underLineBorder
                      : _outlineBorder,
          focusedBorder:
              widget.passwordComplexityIndicator && _passwordRegexMatched
                  ? _outlineGreendBorder
                  : widget.underLineBorder
                      ? _underLineBorder
                      : _outlinePurpleBorder,
          hintText: widget.hint,
          suffixIcon: widget.suffix,
          prefixIcon: widget.prefix,
        ),
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscure,
        maxLength: widget.maxLength,
        onChanged: (value) {
          if (widget.passwordComplexityIndicator) {
            _passwordRegexMatched = false;
            const String _passwordRegex = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])';

            if (RegExp(_passwordRegex).hasMatch(value) &&
                (value.length >= 8 && value.length <= 70)) {
              _passwordRegexMatched = true;
            }
            setState(() {});
          }
        },
      );

  OutlineInputBorder get _outlineBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(Constants.radius),
        borderSide: BorderSide(color: AppColors.greyColors[4]),
      );

  OutlineInputBorder get _outlineGreendBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(Constants.radius),
        borderSide: BorderSide(color: AppColors.greenColors.first, width: 2),
      );

  OutlineInputBorder get _outlinePurpleBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(Constants.radius),
        borderSide: BorderSide(color: AppColors.purpleColors.first, width: 2),
      );

  UnderlineInputBorder get _underLineBorder => UnderlineInputBorder(
        // borderRadius: BorderRadius.circular(Constants.radius),

        borderSide: BorderSide(color: AppColors.greyColors[4]),
      );
}

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.hint,
    required this.label,
    this.validator,
    this.controller,
    this.obscure = false,
    this.readOnly = false,
    this.passwordComplexityIndicator = false,
    this.inputFormatters,
  }) : super(key: key);

  final String hint;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool passwordComplexityIndicator;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFieldWithoutLabel(
            readOnly: readOnly,
            hint: hint,
            controller: controller,
            validator: validator,
            obscure: obscure,
            passwordComplexityIndicator: passwordComplexityIndicator,
            inputFormatters: inputFormatters,
          ),
        ],
      );
}

class PasswordTextFieldWithLabel extends StatefulWidget {
  const PasswordTextFieldWithLabel({
    Key? key,
    required this.hint,
    required this.label,
    this.controller,
    this.validator,
    this.passwordComplexityIndicator = false,
  }) : super(key: key);

  final String hint;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool passwordComplexityIndicator;

  @override
  State<PasswordTextFieldWithLabel> createState() =>
      _PasswordTextFieldWithLabelState();
}

class _PasswordTextFieldWithLabelState
    extends State<PasswordTextFieldWithLabel> {
  bool _obscureText = true;
  bool _passwordRegexMatched = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            obscureText: _obscureText,
            onChanged: (value) {
              if (widget.passwordComplexityIndicator) {
                _passwordRegexMatched = false;
                const String _passwordRegex =
                    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])';

                if (RegExp(_passwordRegex).hasMatch(value)) {
                  _passwordRegexMatched = true;
                }
                setState(() {});
              }
            },
            decoration: InputDecoration(
              border:
                  widget.passwordComplexityIndicator && _passwordRegexMatched
                      ? _outlineGreendBorder
                      : _outlineBorder,
              enabledBorder:
                  widget.passwordComplexityIndicator && _passwordRegexMatched
                      ? _outlineGreendBorder
                      : _outlineBorder,
              hintText: widget.hint,
              suffixIcon: InkWell(
                onTap: _toggle,
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
        ],
      );

  OutlineInputBorder get _outlineBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(Constants.radius),
        borderSide: BorderSide(color: AppColors.greyColors[4]),
      );

  OutlineInputBorder get _outlineGreendBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(Constants.radius),
        borderSide: BorderSide(color: AppColors.greenColors.first),
      );
}

class TypeAheadTextField extends StatelessWidget {
  const TypeAheadTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => TypeAheadFormField(
        itemBuilder: (BuildContext context, itemData) => const Text('data'),
        onSuggestionSelected: (suggestion) => debugPrint('object'),
        suggestionsCallback: (s) => [],
      );
}

class UnderLineTextFieldWithLabel extends StatelessWidget {
  const UnderLineTextFieldWithLabel({
    Key? key,
    required this.hint,
    required this.label,
    this.validator,
    this.controller,
    this.obscure = false,
    this.readOnly = false,
    this.suffix,
    this.prefix,
    this.passwordComplexityIndicator = false,
    this.maxLength,
  }) : super(key: key);

  final String hint;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool passwordComplexityIndicator;
  final bool readOnly;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLength;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFieldWithoutLabel(
            suffix: suffix,
            prefix: prefix,
            underLineBorder: true,
            readOnly: readOnly,
            hint: hint,
            controller: controller,
            validator: validator,
            obscure: obscure,
            passwordComplexityIndicator: passwordComplexityIndicator,
            maxLength: maxLength,
          ),
        ],
      );
}
