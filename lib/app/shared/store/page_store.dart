import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store {
  
  @observable
  PageController pageController = PageController();

  @observable
  int page = 0;

  @action
  void changePage(int index) => page = index;
}
