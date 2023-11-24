import 'package:voyage/model/contact.model.dart';
import 'package:voyage/utils/contact.database.dart';

class ContactService {
  ContactDatabase contactDatabase = ContactDatabase();

  Future<List<Contact>> listeContacts() async{
    var contacts = await contactDatabase.recuperer();
    return contacts.map((e) => Contact.fromJson(e)).toList();
  }
  Future<bool> ajouterContact(Contact c) async {
    var res = await contactDatabase.inserer(c);
    return res > 0 ? true : false;
  }
  Future<bool> modifierContact(Contact c) async {
    var res = await contactDatabase.modifier(c);
    return res > 0 ? true : false;
  }
  Future<bool> suprimerContact(Contact c) async {
    var res = await contactDatabase.suprimer(c);
    return res > 0 ? true : false;
  }
}