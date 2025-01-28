import 'package:app_wktest/app/data/models/pessoa_model.dart';
import 'package:app_wktest/app/data/repositories/pessoa_repository.dart';
import 'package:app_wktest/app/global/constants.dart';
import 'package:app_wktest/app/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PessoaRepository repository;
  HomeController(this.repository);

  final textController = TextEditingController();
  FocusNode focusSearch = FocusNode();

  final pessoas = <Pessoa>[].obs;
  int currentPage = 0;
  final _totalElements = 0.obs;
  final _isLoading = false.obs;
  final _isLoadingMore = false.obs;
  final _loadMore = true.obs;
  final _isFocused = false.obs;
  final _errorAtSearch = ''.obs;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;
  get isLoadingMore => _isLoadingMore.value;
  get loadMore => _loadMore.value;
  get totalElements => _totalElements.value;
  get errorAtSeach => _errorAtSearch.value;
  get isFocused => _isFocused.value;
  final debouncer = Debouncer(1500);

  @override
  void onInit() {
    pesquisar();
    focusSearch.addListener(() => _isFocused.value = focusSearch.hasFocus);
    super.onInit();
  }

  void pesquisar({pesquisa = '', page = 0}) {
    if (page == 0) {
      pessoas.clear();
      currentPage = 0;
      _totalElements.value = 0;
    }
    _isLoading.value = currentPage == 0;
    _isLoadingMore.value = currentPage > 0;
    _errorAtSearch.value = '';

    repository.search(pesquisa, page).then((results) {
      _isLoading.value = false;
      _isLoadingMore.value = false;
      _totalElements.value = results.totalElements;
      if (currentPage == 0) {
        pessoas.assignAll(results.list);
      } else {
        pessoas.addAll(results.list);
      }
      pessoas.refresh();
      _loadMore.value = results.totalElements > pessoas.length;
    }).catchError((error) {
      _isLoadingMore.value = false;
      _errorAtSearch.value = error.toString();
    });
  }

  void enviarDadosLocais() async {
    _isLoading.value = true;
    final String data = await rootBundle.loadString(LOCAL_DATA);
    repository.postData(data).then((results) {
      _isLoading.value = false;
      pesquisar();
    }).catchError((error) {
      _isLoadingMore.value = false;
      _errorAtSearch.value = error.toString();
    });
  }
}
