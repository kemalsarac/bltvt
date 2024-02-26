
import 'package:bltvt_mobile_veterinary/data/responses/sales_search_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/selling_screen_view.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class SellingScreen extends StatelessWidget {
  SellingScreen({Key key}) : super(key: key);

  SellingScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SellingScreenViewModel>(
      viewModelBuilder: (p0) => SellingScreenViewModel(),
      builder: (context, vm) {
        viewModel = vm;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Ürünler"),
            backgroundColor: CustomColor.primaryColor,
            centerTitle: true,
            flexibleSpace: Image(
              image: AssetImage("assets/images/appbar.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          body: buildSellingList(vm.salesData),
        );
      },
    );
  }

  Widget buildSellingList(List<salessearchresponse> salesData) {
    return ListView.builder(
      itemCount: salesData.length,
      itemBuilder: (context, index) {
        final salessearchresponse sales = salesData[index];
        return GestureDetector(
          onTap: () {
       
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      sales.dsCustomer,
                      style: CustomStyle.defaultStyle,
                    ),
                    Row(
                      children: [
                        Text(
                          sales.dsCustomer,
                        ),
                        Text(
                          " ",
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
    );
  }
}