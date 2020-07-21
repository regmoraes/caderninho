import 'package:caderninho/customer/contact.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart' as lib;

typedef void OnContactImported(Contact contact);

class ContactImport extends StatelessWidget {
  final OnContactImported onContactImported;

  ContactImport({this.onContactImported});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.contacts),
      onPressed: () async {
        final fullContact =
            await lib.FlutterContactPicker.pickContact(askForPermission: true);
        onContactImported(
          Contact(
            name: _getFullName(fullContact.name),
            phoneNumber: fullContact.phones.first.number,
          ),
        );
      },
    );
  }

  String _getFullName(lib.StructuredName contactName) {
    final middleName =
        contactName.middleName == null ? "" : " ${contactName.middleName}";
    final lastName =
        contactName.lastName == null ? "" : " ${contactName.lastName}";
    return "${contactName.firstName}$middleName$lastName";
  }
}
