import '../../dialog/error_dialog.dart';
import '../../dialog/success_dialog.dart';
import 'package:flutter/material.dart';
import 'base_view_model.dart';
import '../../utils/extensions/extensions.dart';
import '../../widgets/busy_adorner.dart';
import 'package:provider/provider.dart';

Future<bool> showSuccessDialog(BuildContext context, String text) async {
  return (await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => SuccessDialog(
          title: 'BulutVet',
          subTitle: text,
          buttonName: 'Tamam',
        ),
      )) ??
      false;
}

Future<bool> showErrorDialog(BuildContext context, String text) async {
  return (await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => ErrorDialog(
          title: 'BulutVet',
          subTitle: text,
          buttonName: 'Tamam',
        ),
      )) ??
      false;
}

Future<void> showProgressIndicator(BuildContext context, Future Function() action) async {
  BuildContext dialogContext;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        dialogContext = context;
        return Center(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        );
      });
  await action();
  // ignore: use_build_context_synchronously
  Navigator.pop(dialogContext);
}

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext) viewModelBuilder;
  final Widget Function(BuildContext, T) builder;
  final Future<UIActionResponse> Function(UIActionMessage) uiActionHandler;
  final BoxDecoration busyAdornerDecoration;

  const BaseWidget(
      {Key key, @required this.viewModelBuilder, this.builder, this.busyAdornerDecoration, this.uiActionHandler})
      : assert(viewModelBuilder != null, builder != null),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BaseWidgetState createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  static final BoxDecoration defaultBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild : $context");
    return ChangeNotifierProvider<T>.value(
      value: widget.viewModelBuilder(context),
      child: Consumer<T>(
        builder: (context, viewmodel, child) {
          return _buildContent(context, viewmodel);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, T viewModel) {
    if (viewModel.isBusy && !viewModel.isInitialized) {
      return BusyAdorner(
        boxDecoration: widget.busyAdornerDecoration ??
            defaultBoxDecoration.copyWith(borderRadius: BorderRadius.all(Radius.circular(8.scaleByHeight()))),
      );
    }
    return Stack(
      children: <Widget>[
        widget.builder(context, viewModel),
        Visibility(
          visible: viewModel.isBusy,
          child: BusyAdorner(
            boxDecoration: defaultBoxDecoration.copyWith(
                color: Colors.black26, borderRadius: BorderRadius.all(Radius.circular(8.scaleByHeight()))),
            showStaticText: true,
          ),
        )
      ],
    );
  }
}
