import 'dart:io';

import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_look.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/retail_sales.dart';
import 'package:flutter/material.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
                'assets/images/bulutvet-logo-white.png' , 
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
                ProfileInfoCard(label:companydata.dsCompany , initialValue: companydata.dsCompany ?? 'Default Name'),
                ProfileInfoCard(
                    label: companydata.dsOfficalPhone, initialValue: companydata.dsOfficalPhone ?? 'Default Name'),
                ProfileInfoCard(label: companydata.dsCity + "/" + companydata.dsTown, initialValue: companydata.dsCity + "/" + companydata.dsTown),
                ProfileInfoCard(
                    label: 'vergi dairesi' + companydata.dsTaxOffice, initialValue: companydata.dsTaxOffice),
                ProfileInfoCard(label:  companydata.dsTaxNo, initialValue:  companydata.dsTaxNo ??'Default Name' ),
               
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
          ),  bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => MainMenuScreen()
                        ),
                      )
                      ;
                
                    
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                      Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => SearchScreen()
                        ),
                      )
                     ;
                   
                  },
                ), Text('            '),
                 IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen()
                        ),
                      )
                      ;
                  },
                ),
                 IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                  },
                ),
             
              ],
            ),
          ),
          floatingActionButton: SpeedDial(
              icon: Icons.menu,
              activeIcon: Icons.close,
              spacing: 3,
              childPadding: const EdgeInsets.all(5),
              spaceBetweenChildren: 4,
              visible: true,
              direction: SpeedDialDirection.up,
              elevation: 8,
              animationCurve: Curves.elasticInOut,
              isOpenOnStart: false,
              backgroundColor: CustomColor.primaryColor,
              foregroundColor: Colors.white,
              buttonSize: const Size(60, 60),
              childrenButtonSize: const Size(60, 60),
              children: [
               
                   SpeedDialChild(
                  
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  label: "Hızlı Satış",
                  onTap: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => RetailSalesScreen("")
                        ),
                      )
                     
                ),
                   SpeedDialChild(
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  label: "Hızlı müşteri ekle",
                  onTap: () =>  Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => CustomerEditScreen('')))
                
                ),
                    SpeedDialChild(
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  label: "Depo",
                  onTap: () =>  Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => DepoLookScreen()))
               
                ),
              ]
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
