package hxsearch.algorithms;

import hxstd.util.Comparator;

/**
 * The SearchAlgorithm typedef defines the public API one search algorithm
 * must offer, so the hxsearch.Searcher class can use it.
 *
 * Since we use static methods for our searchers and it is not allowed to define
 * them inside interfaces, this is implemented via a typedef.
 */
typedef TSearchAlgorithm =
{
    /**
     * Searchs the Array for the passed item by using the Comparator to compare the items.
     *
     * This should be used as a wrapper function around internalSearch() that checks if the Array length
     * is zero. If it is zero, nothing is done and false is returned.
     * Also, for recursive functions the Array/Item/Comparator should be stored in a property, so it
     * doesn't need to be passed between each recursive call.
     *
     * @param Array<T>                 arr        the Array to search in
     * @param T                        item       the item to search
     * @param hxstd.util.Comparator<T> comparator the Comparator to use
     *
     * @return Bool true if found
     */
    function search<T>(arr:Array<T>, item:T, comparator:Comparator<T>):Bool;
}
