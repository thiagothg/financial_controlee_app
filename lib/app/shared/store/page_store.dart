import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store implements Disposable {
  
  @observable
  PageController pageController = PageController();

  @observable
  int page = 0;

  // ignore: use_setters_to_change_properties
  @action
  void changePage(int index) => page = index;

   void dispose() {
    pageController.dispose();
  }
}
