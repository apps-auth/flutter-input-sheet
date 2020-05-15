import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'inputs/IpsInput.dart';
import 'utils/colors.dart';

class Sheet {
  final BuildContext _context;
  final String _label;
  final String _cancelText;
  final String _doneText;
  final double paddingVertical;
  final bool showDoneButton;

  Sheet(
    this._context,
    this._label,
    this._cancelText,
    this._doneText, {
    this.paddingVertical: 25,
    this.showDoneButton: true,
  });

  open(IpsInput ipsInput) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: _context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      enableDrag: true,
      isDismissible: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Scaffold(
          // use CupertinoPageScaffold for iOS
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true, // important
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0),
                  height: 45,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: IpsColors.border, width: 1),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(_context);
                          ipsInput.onCancel();
                        },
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FeatherIcons.x,
                              size: 21,
                              color: IpsColors.dark,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              _cancelText,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: IpsColors.dark,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                      Visibility(
                        visible: showDoneButton == true,
                        child: RawMaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ipsInput.onDone();
                          },
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                _doneText,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: IpsColors.dark,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                FeatherIcons.check,
                                size: 21,
                                color: IpsColors.dark,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: paddingVertical,
                  ),
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        visible: _label != null,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            _label ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: IpsColors.gray,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ipsInput
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
