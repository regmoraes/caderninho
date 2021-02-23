
import 'package:caderninho/catalog/bloc/state.dart';
import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/catalog/repository/repository.dart';
import 'package:caderninho/catalog/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CatalogBloc extends Cubit<CatalogState> {
  final CatalogRepository catalogRepository;

  CatalogBloc(this.catalogRepository): super(Fetching());

  void fetchCatalog(CatalogSearch search) async {
    emit(Fetching());
    final fetchResult = await catalogRepository.fetchCatalog(search);
    emit(CatalogUpdated(fetchResult));
  }

  void addProduct(Product product) async {
    emit(AddingProduct());

    final updatedCatalog = await catalogRepository.addProduct(product);

    emit(CatalogUpdated(updatedCatalog));
  }
}
