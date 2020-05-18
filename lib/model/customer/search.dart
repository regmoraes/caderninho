abstract class CustomerSearch {}

class EmptySearch extends CustomerSearch {}

class FetchAll extends CustomerSearch {}

class SearchByTerm extends CustomerSearch {
  final String term;

  SearchByTerm(this.term);
}
