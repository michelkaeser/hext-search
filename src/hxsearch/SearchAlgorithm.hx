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
    /**
     * Searchs the Array for the passed item by using the Comparator to compare the items.
     *
     * @param Array<T>                 arr        the Array to search in
     * @param T                        item       the item to search
     * @param hxstd.util.Comparator<T> comparator the Comparator to use
     *
     * @return Bool true if found
     */
    // public static function sort<T>(arr:Array<T>, item:T comparator:Comparator<T>):Bool;
}
