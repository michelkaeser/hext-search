package hxsearch;

import hxstd.util.Comparator;

/**
 * The SearchAlgorithm interface defines the public API one search algorithm
 * must offer, so the hxsearch.Searcher class can use it.
 *
 * Since we use static methods for our searchers and it is not allowed to define
 * them inside interfaces, this is a pure marker interface and the programmer
 * must make sure, the method is included.
 */
interface SearchAlgorithm
{
}
