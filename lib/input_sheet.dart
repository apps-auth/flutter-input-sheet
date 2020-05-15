library input_sheet;


import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:input_sheet/inputs/IpsInputDatetime.dart';
import 'package:input_sheet/inputs/IpsInputTime.dart';

import 'inputs/IpsInputDate.dart';
import 'inputs/IpsInputLongtext.dart';
import 'inputs/IpsInputMask.dart';
import 'inputs/IpsInputNumber.dart';
import 'inputs/IpsInputOptions.dart';
import 'inputs/IpsInputText.dart';
import 'sheet.dart';

class InputSheet {
  final BuildContext _context;
  final String label;
  final String cancelText;
  final String doneText;
  final bool keyboardAutofocus;

  InputSheet(
    this._context, {
    this.label = "Label",
    this.cancelText = "Cancel",
    this.doneText = "Done",
    this.keyboardAutofocus = false,
  });

  text({
    TextInputType textInputType = TextInputType.text,
    String placeholder = "Placeholder",
    dynamic value,
    Function(String) onDone,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputText(
      textInputType,
      placeholder,
      value,
      onDone,
      autofocus: keyboardAutofocus,
    ));
  }

  longtext({
    String placeholder = "Placeholder",
    String value,
    Function(String) onDone,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputLongtext(
      onDone,
      placeholder: placeholder,
      value: value,
      autofocus: keyboardAutofocus,
    ));
  }

  mask({
    TextInputType textInputType = TextInputType.text,
    String placeholder = "Placeholder",
    dynamic value,
    List<String> masks,
    Function(dynamic) onDone,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputMask(
      textInputType,
      placeholder,
      masks,
      value,
      onDone,
      autofocus: keyboardAutofocus,
    ));
  }

  number({
    String decimalSeparator = "",
    String thousandSeparator = "",
    String leftSymbol = "",
    String rightSymbol = "",
    int precision = 0,
    String placeholder = "Placeholder",
    double value,
    Function(double) onDone,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputNumber(
      onDone,
      placeholder: placeholder,
      value: value,
      autofocus: keyboardAutofocus,
      decimalSeparator: decimalSeparator,
      thousandSeparator: thousandSeparator,
      leftSymbol: leftSymbol,
      rightSymbol: rightSymbol,
      precision: precision,
    ));
  }

  date({
    String value,
    Function(String) onDone,
    DateTime minDateTime,
    DateTime maxDateTime,
    DateTimePickerLocale locale = DateTimePickerLocale.en_us,
    String format = "yyyy-MM-dd",
    String pickerFormat = "yyyy|MMMM|dd",
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(
      new IpsInputDate(
        onDone,
        value: value,
        locale: locale,
        format: format,
        pickerFormat: pickerFormat,
        minDateTime: minDateTime,
        maxDateTime: maxDateTime,
      ),
    );
  }

  time({
    String value,
    Function(String) onDone,
    DateTime minDateTime,
    DateTime maxDateTime,
    DateTimePickerLocale locale = DateTimePickerLocale.en_us,
    String format = "HH:mm:ss",
    String pickerFormat = "HH|mm|ss",
    int minuteDivider = 1,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(
      new IpsInputTime(
        onDone,
        value: value,
        locale: locale,
        format: format,
        pickerFormat: pickerFormat,
        minDateTime: minDateTime,
        maxDateTime: maxDateTime,
        minuteDivider: minuteDivider,
      ),
    );
  }

  datetime({
    String value,
    Function(String) onDone,
    DateTime minDateTime,
    DateTime maxDateTime,
    DateTimePickerLocale locale = DateTimePickerLocale.en_us,
    String format = "yyyy/MM/dd HH:mm",
    String pickerFormat = "yyyy/MM/dd|HH|mm",
    int minuteDivider = 1,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(
      new IpsInputDatetime(
        onDone,
        value: value,
        locale: locale,
        format: format,
        pickerFormat: pickerFormat,
        minDateTime: minDateTime,
        maxDateTime: maxDateTime,
        minuteDivider: minuteDivider,
      ),
    );
  }

  options({
    dynamic value,
    Map<String, String> options,
    Function(String) onDone,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(
      new IpsInputOptions(
        onDone,
        value: value,
        options: options,
      ),
    );
  }


  //TO-DO
  //slider() {}
  //colors() {}
  //multioptions() {}
}
