import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<Profilscreenviewmodel>(
      viewModelBuilder: (p0) => Profilscreenviewmodel(),
      builder: (p0, Profilscreenviewmodel vm) {
        return Scaffold(
          backgroundColor: CustomColor.accentColor,
          appBar: AppBar(
            title: Row(
            children: [
              Image.asset(
                'assets/images/bulutvet-logo-white.png', 
                height: 30,  
                width: 102,   
                fit: BoxFit.cover,
              ),
             
            ],
          ),
            centerTitle: false,
            backgroundColor: CustomColor.primaryColor,
            automaticallyImplyLeading: false,
            flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 105,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child:   CircleAvatar(
                            radius: 50,
                            backgroundImage: (companydata != null &&
                                    companydata.dsLogoUrl != null &&
                                    companydata.dsLogoUrl.isNotEmpty)
                                ? NetworkImage(companydata.dsLogoUrl)
                                : AssetImage("assets/images/anonymous.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                ProfileInfoCard(label: 'Şirket ismi', initialValue: companydata.dsCompany ?? 'Default Name'),
                ProfileInfoCard(
                    label: 'Telefon numarası', initialValue: companydata.dsOfficalPhone ?? 'Default Name'),
                ProfileInfoCard(label: 'İl/İlçe', initialValue: companydata.dsCity + "/" + companydata.dsTown),
                ProfileInfoCard(
                    label: 'Vergi dairesi', initialValue: companydata.dsTaxOffice),
                ProfileInfoCard(label: 'Vergi no', initialValue: companydata.dsTaxNo),
               
                const SizedBox(height: 1),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                       _showExitDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.blueGrey,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Çıkış yap',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextButton(
                      onPressed: () {
                        _showuseragreementDialog(context);
                      },
                      child: const Text(
                        'Kullanıcı sözleşmesi',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextButton(
                      onPressed: () {
                        _showAydinlatmametnDialog(context);
                      },
                      child: const Text(
                        'Aydınlatma metni',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextButton(
                      onPressed: () {
                        _showaboutDialog(context);
                      },
                      child: const Text(
                        'BulutVet hakkında',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextButton(
                      onPressed: () {
                        _showcommunicationDialog(context);
                      },
                      child: const Text(
                        'Bize Ulaşın',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Hesabınızı silmek mi istiyorsunuz?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            _showDeleteAccountDialog(context);
                          },
                          child: const Text(
                            'Hesabı sil',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
void _showExitDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("BulutVet'ten çıkış yapmak istediğinize emin misiniz?"),
        
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '    İptal',
              style: TextStyle(color: Colors.green),
            ),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: const Text(
              'Çıkış yap',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}


void _showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Hesabı Sil'),
        content: const Text('Hesabınızı silmek istediğinizden emin misiniz?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '    İptal',
              style: TextStyle(color: Colors.green),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Sil',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
void _showuseragreementDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(

        title: const Text('Kullanıcı Sözleşmesi'),
        content: const Text('Kullanıcı Sözleşmesi burada yer alacaktır!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '    Kapat',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Kabul Ediyorum',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
}
void _showAydinlatmametnDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(

        title: const Text('Aydınlatma Metni'),
        content: const Text('Aydınlatma Metni burada yer alacaktır!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '    Kapat',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Okudum,anladım',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
}
void _showaboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(

        title: const Text('BulutVet Hakkında'),
        content: const Text('BulutVet Hakkında kısmı burada yer alacaktır!'),
        actions: <Widget>[
           
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Kapat',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
void _showcommunicationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Bize Ulaşın'),
        content: const Text('Adresimiz: Merdivenkoy Mah. Yumurtacı Abdi Bey Cad. Dikyol Sk. Business Istanbul B. Blok Kat: 14 Daire:140 Kadiköy/istanbul \n  \n Telefon: 0216 599 04 18 '),
        actions: <Widget>[
         
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Kapat',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}



class ProfileInfoCard extends StatefulWidget {
  final String label;
  final String initialValue;
  final Function(String) onSave;

  ProfileInfoCard({this.label, this.initialValue, this.onSave});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileInfoCardState createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
  TextEditingController _controller;
  bool _isEditing = false;

  @override
/*  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  } */

  void _editValue() {
    setState(() {
      _isEditing = !_isEditing;
    });
    if (_isEditing) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                enabled: false,
                decoration: InputDecoration(
                  labelText: widget.label,
                  border: const OutlineInputBorder(),
                ),
                onTap: () {
                  if (!_isEditing) {
                    _editValue();
                  }
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  
}
