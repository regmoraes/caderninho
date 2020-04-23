abstract class CatalogSearch {}

class EmptySearch extends CatalogSearch {}

class FetchAll extends CatalogSearch {}

class SearchByTerm extends CatalogSearch {
  final String term;

  SearchByTerm(this.term);
}
