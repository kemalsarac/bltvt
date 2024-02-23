// ignore_for_file: use_build_context_synchronously, no_logic_in_create_state, must_be_immut
import 'package:bltvt_mobile_veterinary/data/responses/depohak_response.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depotransferviewmodel.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:flutter/material.dart';
import '../../data/responses/get_all_products_response.dart';
// ignore: depend_on_referenced_packages

class WarehouseTransfer extends StatefulWidget {
  GetAllProductsResponse Productkod;

  int selectedDepoAdi;
  WarehouseTransfer(
    this.Productkod, {
    this.selectedDepoAdi,
    Key key,
  }) : super(key: key);

  @override
  _WarehouseTransferState createState() => _WarehouseTransferState();
}

class _WarehouseTransferState extends State<WarehouseTransfer> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<WarehouseTransferViewModel>(
      viewModelBuilder: (p0) => WarehouseTransferViewModel(
        widget.Productkod,
        widget.selectedDepoAdi,
      ),
      builder: (context, vm) {
        return DefaultTabController(
          length: 1,
          initialIndex: 0,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
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
                    text: "DETAYLAR",
                  ),
                ],
              ),
              title: const Text('Depolar arası Transfer'),
              flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      TabPage1(
                        vm,
                        widget.Productkod,
                      ),
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

class TabPage1 extends StatefulWidget {
  final WarehouseTransferViewModel vm;
  final GetAllProductsResponse Productkod;

  List<depohak> depoidsi;

  TabPage1(this.vm, this.Productkod, {Key key}) : super(key: key);

  @override
  State<TabPage1> createState() => _TabPage1State(vm, Productkod);
}

class _TabPage1State extends State<TabPage1>
    with AutomaticKeepAliveClientMixin {
  WarehouseTransferViewModel vm;
  int selectedDepoAdi;
  int productId;
  double warecategoMtpiece = 0;
  _TabPage1State(this.vm, GetAllProductsResponse productKod) {
    productId = productKod.idProduct;
  }

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
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Stok çıkışı yapılacak depo",
                          style: CustomStyle.kTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        isEmpty: vm.selectedwarehousesType1 == null ?? true,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: vm.selectedwarehousesType1,
                            isDense: true,
                            onChanged: (String newValue) async {
                              setState(() {
                                vm.selectedwarehousesType1 = newValue;
                                state.didChange(newValue);
                                vm.refreshState();

                                selectedDepoAdi = vm.depoTuru
                                    .firstWhere(
                                      (depohak) =>
                                          depohak.dsGuidId.toString() ==
                                          newValue,
                                    )
                                    .idWarehouse;
                                vm.updateWarecategory();
                                vm.refreshState();
                              });
                            },
                            items: vm.depoTuru.map((depohak dattta) {
                              return DropdownMenuItem<String>(
                                value: dattta.dsGuidId.toString(),
                                child: Text(
                                  dattta.dsWarehouse,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    "seçilen depo  $selectedDepoAdi ",
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "ürün idsi = $productId",
                    style: CustomStyle.kTitleStyle,
                  ),
                  Text(
                    "ürün stok = ${widget.vm.warecategoMtpiece} " ?? "",
                    style: CustomStyle.kTitleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Stok girişi yapılacak depo",
                          style: CustomStyle.kTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        isEmpty: vm.selectedwarehousesType2 == null ?? true,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: vm.selectedwarehousesType2,
                            isDense: true,
                            onChanged: (String newValue) async {
                              setState(() {
                                vm.selectedwarehousesType2 = newValue;
                                state.didChange(newValue);
                                vm.refreshState();
                              });
                            },
                            items: vm.depoTuru.map((depohak dattta) {
                              return DropdownMenuItem<String>(
                                value: dattta.dsGuidId.toString(),
                                child: Text(
                                  dattta.dsWarehouse,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Miktar:",
                          style: CustomStyle.kTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      initialValue: vm.transferware.mtPieces.toString(),
                      maxLength: 50,
                      decoration: const InputDecoration(),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "İsim boş olamaz";
                        }

                        double parsedValue = double.tryParse(val);
                        if (parsedValue == null) {
                          return "Geçerli bir sayı girin";
                        }

                        widget.vm.transferware.mtPieces = parsedValue;
                        return null;
                      },
                      onSaved: (value) {
                        double parsedValue = double.tryParse(value ?? '');
                        widget.vm.transferware.mtPieces = parsedValue ?? 0.0;
                      },
                    ),
                  ),
                ],
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
