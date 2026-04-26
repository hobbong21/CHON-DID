// See installation notes below regarding AndroidManifest.xml and Info.plist
import 'package:flutter_contacts/flutter_contacts.dart';

class ContractService {
  static Future<List<Contact>> getContracts() async {
    if (await FlutterContacts.requestPermission(readonly: true)) {
      List<Contact> contacts =
          await FlutterContacts.getContacts(withProperties: true);
      return contacts;
    }
    return [];
  }
}
