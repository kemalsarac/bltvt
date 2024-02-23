
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_detail_edit_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:flutter/material.dart';

class VaccinesdetaileditScreen extends StatelessWidget {
  final VaccinesdetaileditviewScreen vm;

 VaccinesdetaileditScreen({Key key, this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 1,
          initialIndex: 0,
          child: Form(
            
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () async {
                 

                
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
}

class TabPage1 extends StatefulWidget {
  final VaccinesdetaileditviewScreen vm;

  const TabPage1(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage1> createState() => _TabPage1State(vm);
}

class _TabPage1State extends State<TabPage1>
    with AutomaticKeepAliveClientMixin {
  VaccinesdetaileditviewScreen vm;

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
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'Ürün Adı',
                  prefixIcon: Icon(Icons.production_quantity_limits),
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Ürün Adı boş olamaz";
                  }
                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
              
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'Ürün Barkod',
                  prefixIcon: Icon(Icons.barcode_reader),
                ),
               
                  
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'Alış Fiyatı',
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                ),
                
                
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'Satış Fiyatı',
                  prefixIcon: Icon(Icons.monetization_on),
                ),
                
                
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
