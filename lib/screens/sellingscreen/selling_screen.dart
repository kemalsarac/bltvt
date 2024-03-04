import 'package:bltvt_mobile_veterinary/data/responses/sales_search_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
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
              // İlk butona tıklandığında yapılacak işlemler
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF17a2b8)),
            ),
            child: Text("PERAKENDE SATIŞ"),
          ),
          ElevatedButton(
            onPressed: () {
              // İkinci butona tıklandığında yapılacak işlemler
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF28a745)),
            ),
            child: Text("KAYITLI  SATIŞ"),
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
                          horizontal: 10.0,
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColor.accentColor,
                          border: Border.all(
                            color: CustomColor.primaryColor,
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
                                            sales.dsCustomer,
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
                    vm.loadMoreCustomers(query, vm.salesData.length),
              );
            },
          ),
        ),
      ),
    );
  }
  Widget buildButtonColumn() {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildTextButton(
            icon: Icons.add_box_outlined,
            label: "Ürün",
            color: CustomColor.primaryColor,
          ),
          buildTextButton(
            icon: Icons.delete,
            label: "Sil",
            color: CustomColor.redColor,
          ),
        ],
      ),
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
}