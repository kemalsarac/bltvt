/*import 'package:bltvt_mobile_veterinary/data/requests/update_product_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_product_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/warehouses_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/products/products_detail_edit_view_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/products/products_detail_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/products/products_screen.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductdetaileditScreen extends StatelessWidget {
  final ProductdetaileditviewScreen vm;
   String proguid = '';
    String productDetail;

  final _keyForm = GlobalKey<FormState>();
 

  ProductdetaileditScreen(this.proguid, 
      {Key key, this.vm})
      : super(key: key);
  @override
  Widget build(BuildContext context)  {
    return BaseWidget<ProductdetaileditviewScreen>(
      viewModelBuilder: (p0) => ProductdetaileditviewScreen(proguid),
      builder: (context, vm) {
    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Form(
         key: _keyForm,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
                  var flValid = _keyForm.currentState.validate();
                  _keyForm.currentState.save();
                  if (vm.urun.dsProduct == null) vm.urun.dsProduct = '';
                  if (vm.urun.dsBarcode == null) vm.urun.dsBarcode = '';
                  if (vm.urun.mtPriceBuying == null) vm.urun.mtPriceBuying = 0;
                  if (vm.urun.mtPrice == null) vm.urun.mtPrice = 0;
                  var result = UpdateProductResponse();
                  if (flValid) {
                    if (proguid == ''){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductsScreen(),
                        ),
                      );

                    }else {
                      result = await vm.updateProsuctStatus();

                      if (result.dsGuidId != null) {
                        Fluttertoast.showToast(
                          msg: "Ürün kaydedildi",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 20,
                          toastLength: Toast.LENGTH_LONG,
                        );

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductdetaileditScreen(proguid)));
                      } else {
                        for (var element in result.messageList) {
                          Fluttertoast.showToast(
                            msg: element.message,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20,
                            toastLength: Toast.LENGTH_LONG,
                          );
                        }
                      }
                    }
                  }

                 
                  if (flValid) {
                    if (proguid == '') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductsScreen(),
                        ),
                      );
                    } 
                   
                  } else {
                    Fluttertoast.showToast(
                      msg: "Lütfen Eksik Bilgileri Doldurunuz!",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 20,
                      toastLength: Toast.LENGTH_LONG,
                    );
                  }
                 },
            backgroundColor: CustomColor.primaryColor,
            label: const Text("KAYDET"),
            icon: const Icon(
              Icons.save,
              color: Colors.white,
              size: 30,
            ),
          ),
          appBar: AppBar(
            backgroundColor: CustomColor.primaryColor,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: CustomColor.primaryColor,
              tabs: [
                Tab(
                  text: "TANIM",
                ),
              ],
            ),
            title: const Text('Ürün Bilgileri'),
            flexibleSpace: Image(
              image: AssetImage("assets/images/appbar1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          body: TabBarView(
            children: [
              TabPage1(vm),
            ],
          ),
        ),
      ),
    );
     }
    );
  }
}

class TabPage1 extends StatefulWidget {
  final ProductdetaileditviewScreen vm;

  const TabPage1(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage1> createState() => _TabPage1State(vm);
}

class _TabPage1State extends State<TabPage1>
    with AutomaticKeepAliveClientMixin {
  ProductdetaileditviewScreen vm;

  _TabPage1State(this.vm);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  hintText: 'Ürün Adı',
                  prefixIcon: Icon(Icons.production_quantity_limits),
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Ürün Adı boş olamaz";
                  }
                  widget.vm.urun.dsProduct = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.urun.dsProduct = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                // controller: _name,
                maxLength: 50,
                decoration: const InputDecoration(
                  hintText: 'Ürün Barkod',
                  prefixIcon: Icon(Icons.barcode_reader),
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Barkod boş olamaz";
                  }
                  widget.vm.urun.dsBarcode = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.urun.dsBarcode = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                // controller: _name,
                maxLength: 50,
                decoration: const InputDecoration(
                  hintText: 'Alış Fiyatı',
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                ),
                validator: (val) {
                  try {
                    widget.vm.urun.mtPriceBuying = int.parse(val ?? '');
                  } catch (e) {
                    return 'Geçerli  fiyat girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  widget.vm.urun.mtPriceBuying =
                      int.tryParse(value ?? '') ?? 0;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                // controller: _name,
                maxLength: 50,
                // Örnek metni buraya ekleyin
                decoration: const InputDecoration(
                  hintText: 'Satış Fiyatı',
                  prefixIcon: Icon(Icons.monetization_on),
                ),
                validator: (val) {
                  try {
                    widget.vm.urun.mtPrice = int.parse(val ?? '');
                  } catch (e) {
                    return 'Geçerli bir fiyat girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  widget.vm.urun.mtPrice =
                      int.tryParse(value ?? '') ?? 0;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
*/