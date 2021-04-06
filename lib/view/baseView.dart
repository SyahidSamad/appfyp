import 'package:appfyp/presenter/basePresenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

class BaseView<T extends BasePresenter> extends StatefulWidget {
  final Widget Function(BuildContext context, T presenter, Widget child)
      builder;
  final Function(T) onPresenterReady;
  BaseView({@required this.builder, this.onPresenterReady});
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BasePresenter> extends State<BaseView<T>> {
  T presenter = locator<T>();
  @override
  void initState() {
    if (widget.onPresenterReady != null) {
      widget.onPresenterReady(presenter);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => presenter,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
