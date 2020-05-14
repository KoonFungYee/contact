import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contacts_service/contacts_service.dart';

class Contact1 extends StatefulWidget {
  Contact1({Key key}) : super(key: key);

  @override
  _Contact1State createState() => _Contact1State();
}

class _Contact1State extends State<Contact1> {
  Contact contact = Contact();
  PostalAddress address = PostalAddress(label: "Home");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text('data'),
          onPressed: () {
            contact.givenName = "abc";
            contact.phones = [Item(label: "mobile", value: '01023')];
            contact.emails = [
              Item(label: "work", value: 'kelvin2274@hotmail.com')
            ];
            contact.company = 'JTApps Sdn Bhd';
            address.region = 'Selangor';
            address.city = 'area';
            address.country = 'Malaysia';
            contact.postalAddresses = [address];
            contact.jobTitle = 'Industry';
            contact.birthday = DateTime(2019, 01, 01);
            ContactsService.addContact(contact);
          }),
    );
  }
}
