import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_transfer.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_detail_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class VaccinesScreen extends StatefulWidget {
  const VaccinesScreen({Key key}) : super(key: key);

  @override
  State<VaccinesScreen> createState() => _VaccinesScreenState();
}

class _VaccinesScreenState extends State<VaccinesScreen> {
  List<GetAllProductsResponse> products, allProducts;
  String query = '';
  VaccinesScreenViewModel viewModel;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<VaccinesScreenViewModel>(
      viewModelBuilder: (p0) => VaccinesScreenViewModel(),
      builder: (context, vm) {
        viewModel = vm;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Aşılar"),
            backgroundColor: Colors.transparent,
            centerTitle: true,
             flexibleSpace: Image(
            image: AssetImage("assets/images/appbar.jpg"), 
            fit: BoxFit.cover,
          ),
          ),
          body:  GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.primaryVelocity > 0) {
                  Navigator.pop(context);
                }
              },
              child: Column(
                children: <Widget>[
                  Container(
                    child: buildSearch(context, vm),
                  ),
                  buildProductList(context, vm),
                ],
              ),
            ),
        );
      },
    );
  }

  Widget buildSearch(BuildContext context, VaccinesScreenViewModel vm) {
    allProducts = vm.productList;
    return SearchWidget(
      text: query,
      hintText: 'aşı arama',
      onChanged: searchCustomer,
    );
  }

  void searchCustomer(String query) {
    this.query = query;
    viewModel.searchText(query);
  }

  Widget buildProductList(BuildContext context, VaccinesScreenViewModel vm) {
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
                  itemCount: vm.productList.length,
                  itemBuilder: (context, index) {
                    final GetAllProductsResponse product =
                        vm.productList[index];

                    return GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VaccinesDetailScreen(product),
                          ),
                        ).then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WarehouseTransfer(product),
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        })
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  product.dsProduct,
                                  style: CustomStyle.defaultStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      product.mtPrice.toString() == "null"
                                          ? "0"
                                          : product.mtPrice
                                                      .toString()
                                                      .split(".")
                                                      .last ==
                                                  "0"
                                              ? product.mtPrice
                                                  .toString()
                                                  .split(".")
                                                  .first
                                              : product.mtPrice.toString(),
                                      style: CustomStyle.defaultStyle,
                                    ),
                                    Text(
                                      " ₺",
                                      style: CustomStyle.defaultStyle,
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
                ),
                onEndOfPage: () =>
                    vm.loadMoreProducts(query, vm.productList.length),
              );
            },
          ),
        ),
      ),
    );
  }
}
