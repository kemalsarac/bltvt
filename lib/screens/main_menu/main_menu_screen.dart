import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/admissions/admissions_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/bilanco_screen/bilanco_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customers_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/products/products_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/retail_sales.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/selling_screen.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:bltvt_mobile_veterinary/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  MainMenuViewModel viewModel = MainMenuViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<MainMenuViewModel>(
      viewModelBuilder: (p0) => MainMenuViewModel(),
      builder: (p0, vm) {
        viewModel = vm;
        return Scaffold(
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Image(
              image: AssetImage("assets/images/appbar.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: CustomColor.accentColor,
          body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 30.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                  alignment: Alignment.center,
                  child: Text(
                    "Günlük Randevu: ${vm.hesaptablosu.appointmentRate.toInt()}    ",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                SizedBox(height: 2.0),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 0.scaleByHeight(),
                    crossAxisSpacing: 0.scaleByHeight(),
                    crossAxisCount: 3,
                    children: const <Widget>[
                      MainMenuItemWidget('Müşteriler', Icons.groups),
                      MainMenuItemWidget(
                          'Randevu', Icons.date_range_outlined),
                      MainMenuItemWidget('Ürünler', Icons.shopping_bag),
                      MainMenuItemWidget('Aşılar', Icons.vaccines),
                      MainMenuItemWidget('Satışlar', Icons.sell),
                      MainMenuItemWidget(
                          'Özet', Icons.account_balance_wallet_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),    bottomNavigationBar: BottomAppBar(
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
                      .then(
                        (value) => setState(
                          () {
                            vm.refreshState();
                          },
                        ),
                      );
                
                    
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
                      .then(
                        (value) => setState(
                          () {
                            vm.refreshState();
                          },
                        ),
                      );
                   
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
                      .then(
                        (value) => setState(
                          () {
                            vm.refreshState();
                          },
                        ),
                      );
                  },
                ),
                 IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () { Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => AdmissionsScreen()
                        ),
                      )
                      .then(
                        (value) => setState(
                          () {
                            vm.refreshState();
                          },
                        ),
                      );
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
                      .then(
                        (value) => setState(
                          () {
                            vm.refreshState();
                          },
                        ),
                      ), 
                ),
                   SpeedDialChild(
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  label: "Hızlı müşteri ekle",
                  onTap: () =>  Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => CustomerEditScreen('')))
                .then((value) => setState(() {
                      vm.refreshState();
                    })),
                ),
                    SpeedDialChild(
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  label: "Depo",
                  onTap: () =>  Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => CustomerEditScreen('')))
                .then((value) => setState(() {
                      vm.refreshState();
                    })),
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

class MainMenuItemWidget extends StatelessWidget {
  const MainMenuItemWidget(this.title, this.icon, {Key key}) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (title) {
          case "Müşteriler":
            _navigateToScreen(context, CustomersScreen());
            break;
          case "Ürünler":
            _navigateToScreen(context, const ProductsScreen());
            break;
          case "Aşılar":
            _navigateToScreen(context, const VaccinesScreen());
            break;
          case "Randevular":
            _navigateToScreen(context, AdmissionsScreen());
            break;
            case "Satışlar":
            _navigateToScreen(context, SellingScreen());
            break;
            

          case "Özet":
            _navigateToScreen(context, BilancoScreen());
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.06),
                blurRadius: 50.0,
                spreadRadius: 0.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 50.0.scaleByHeight(),
                color: CustomColor.primaryColor,
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutQuart;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 1),
      ),
    );
  }
}