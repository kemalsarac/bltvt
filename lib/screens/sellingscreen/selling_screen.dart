 import 'package:bltvt_mobile_veterinary/data/responses/sales_search_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/registered_customer.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/retail_sales.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/selling_screen_view.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:intl/intl.dart';

class SellingScreen extends StatefulWidget {
  const SellingScreen({Key key}) : super(key: key);

  @override
  State<SellingScreen> createState() => _SellingScreenState();
}

class _SellingScreenState extends State<SellingScreen> {
  List<salessearchresponse> sales, allSales;
  String query = '';
  SellingScreenViewModel viewModel;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Herhangi bir kaynağı temizleme işlemleri buraya eklenmeli
    super.dispose(); // super.dispose() yöntemini çağırmayı unutmayın
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SellingScreenViewModel>(
      viewModelBuilder: (p0) => SellingScreenViewModel(),
      builder: (context, vm) {
        viewModel = vm;
        return Scaffold(
          appBar: buildAppBar(),
          body: Column(
            children: [
              buildButtonRow(),
              buildSearch(context, vm),
              Expanded(
                child: buildSellingList(context, vm),
                
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildAppBar() {
    return AppBar(
      title: const Text("Satışlar"),
      backgroundColor: CustomColor.primaryColor,
      centerTitle: true,
      flexibleSpace: Image(
        image: AssetImage("assets/images/appbar1.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildSearch(BuildContext context, SellingScreenViewModel vm) {
    allSales = vm.salesData;
    return SearchWidget(
      text: query,
      hintText: 'Satış arama',
      onChanged: searchSales,
    );
  }

  void searchSales(String query) {
    this.query = query;
    viewModel.searchText(query);
  }

  Widget buildButtonRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              navigateToRetailSalesScreen();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF17a2b8)),
            ),
            child: Text("PERAKENDE SATIŞ" , style: TextStyle(fontSize: 10)),
          ),
          ElevatedButton(
            onPressed: () {
              navigateToRegisteredCustomerScreen();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF28a745)),
            ),
            child: Text("KAYITLI MÜŞTERİ SATIŞ" , style: TextStyle(fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget buildSellingList(BuildContext context, SellingScreenViewModel vm) {
  return Expanded(
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: ScrollWrapper(
          promptAlignment: Alignment.bottomLeft,
          scrollController: scrollController,
          promptTheme: const PromptButtonTheme(
            elevation: 30,
            color: CustomColor.primaryColor,
            icon: Icon(
              Icons.arrow_circle_up,
              size: 40,
              color: Colors.white,
            ),
          ),
          builder: (BuildContext context, ScrollViewProperties properties) {
            return LazyLoadScrollView(
              child: ListView.builder(
                controller: properties.scrollController,
                scrollDirection: properties.scrollDirection,
                itemCount: vm.salesData.length,
                itemBuilder: (context, index) {
                  final salessearchresponse sales = vm.salesData[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                   Row(
                                        children: [
                                          Text(
                                            "Tarih:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            DateFormat("dd/MM/y")
                                                .format(DateTime.tryParse(
                                                sales.dtDocument) ??
                                                DateTime.now())
                                                .toString(),
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Fatura No:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "#${sales.dsDocument}",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Müşteri Adı:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                           (sales.dsCustomer ?? "") .length > 13 ? "${sales.dsCustomer.substring(0,15)}..."
                                            : sales.dsCustomer,
                                            style:
                                            const TextStyle(fontSize: 17),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Ödeme Yöntemi:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            sales.dsPaymentType,
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Tutar:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            sales.mtTotal.toString() == "null"
                                                ? "0"
                                                : sales.mtTotal
                                                .toString()
                                                .split(".")
                                                .last == "0"
                                                ? sales.mtTotal
                                                .toString()
                                                .split(".")
                                                .first
                                                : sales.mtTotal.toString(),
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            " ₺",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                  
                                    buildButtonColumn(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              onEndOfPage: () =>
                  vm.loadMoreSales(query, vm.salesData.length),
            );
          },
        ),
      ),
    ),
  );
}

  Widget buildButtonColumn() {
    return Stack(
      children: [
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             
              buildTextButton(
                icon: Icons.delete,
                label: "Sil",
                color: CustomColor.redColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTextButton({
    VoidCallback onPressed,
    IconData icon,
    String label,
    Color color,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 25,
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }

  void navigateToRetailSalesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RetailSalesScreen("")),
    );
  }

  void navigateToRegisteredCustomerScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisteredCustomerScreen("")),
    );
  }
}


/* Row(
                                        children: [
                                          Text(
                                            "Tarih:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            DateFormat("dd/MM/y")
                                                .format(DateTime.tryParse(
                                                sales.dtDocument) ??
                                                DateTime.now())
                                                .toString(),
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Fatura No:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "#${sales.dsDocument}",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Müşteri Adı:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                           (sales.dsCustomer ?? "") .length > 13 ? "${sales.dsCustomer.substring(0,15)}..."
                                            : sales.dsCustomer,
                                            style:
                                            const TextStyle(fontSize: 17),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Ödeme Yöntemi:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            sales.dsPaymentType,
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Tutar:",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            sales.mtTotal.toString() == "null"
                                                ? "0"
                                                : sales.mtTotal
                                                .toString()
                                                .split(".")
                                                .last == "0"
                                                ? sales.mtTotal
                                                .toString()
                                                .split(".")
                                                .first
                                                : sales.mtTotal.toString(),
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            " ₺",
                                            style:
                                            const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                      buildButtonColumn(), 
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                             child: ListView.builder(
                controller: properties.scrollController,
                scrollDirection: properties.scrollDirection,
                itemCount: vm.salesData.length,
                itemBuilder: (context, index) {
                  final salessearchresponse sales = vm.salesData[index];
                  return GestureDetector(
                    onTap: () {},
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, top: 10, right: 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 35, top: 5, right: 30),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: 
                            ),
                            Positioned(
                              top: 27,
                              right: 10,
                              child: GestureDetector(
                                onTap: () => navigateToEditCustomerScreen(
                                    context, vm, contact),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.edit_document,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),     */


