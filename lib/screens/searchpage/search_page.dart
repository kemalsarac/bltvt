import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_customer_search_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_profile_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customers_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:bltvt_mobile_veterinary/utils/extensions/extensions.dart';
import 'package:bltvt_mobile_veterinary/widgets/no_image_widget.dart';
import 'package:bltvt_mobile_veterinary/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with ChangeNotifier {
  List<GetCustomerSearchResponse> customers, allCustomers;
  String query = '';
  SearchScreenViewModel viewModel;
  ScrollController scrollController = ScrollController();
  int _selectedIndex = 0; // Seçili sekmenin dizini

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SearchScreenViewModel>(
      viewModelBuilder: (p0) => SearchScreenViewModel(),
      builder: (context, vm) {
        viewModel = vm;
        return Scaffold(
          appBar: buildAppBar(),
          body: Column(
            children: <Widget>[
              Container(
                child: buildSearch(context, vm),
              ),
           
            ],
          ),
        
          
         
        );
      },
    );
  }

  Widget buildAppBar() {
    return AppBar(
      title: const Text("Müşteriler"),
      backgroundColor: CustomColor.primaryColor,
      centerTitle: true,
      flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
    );
  }

  Widget buildSearch(BuildContext context, SearchScreenViewModel vm) {
    allCustomers = vm.customerList;
    return SearchWidget(
      text: query,
      hintText: 'müşteri arama',
      onChanged: searchCustomer,
    );
  }

  void searchCustomer(String query) {
    this.query = query;
    viewModel.searchText(query);
  }
 


  

  TextButton buildTextButton({
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

  
  Text buildText(String text, Color color, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }

 

  void showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 20,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 20,
      toastLength: Toast.LENGTH_LONG,
    );
  }
