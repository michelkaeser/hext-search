package hext.search.array;

import hext.utils.Comparator;

/**
 * Interface for Array search algorithms.
 *
 * @generic T the type of items the Array contains
 */
interface IArraySearchAlgorithm<T>
{
    /**
     * Stores the Comparator used to compare two items.
     *
     * @var hext.utils.Comparator<T>
     */
    public var comparator:Comparator<T>;


    /**
     * Checks if the item is found within the provided Array.
     *
     * If the item is not found, -1 is returned.
     *
     * @param T              item the item to look for
     * @param Null<Array<T>> arr  the Array to search in
     *
     * @return Int the index at which the item was found
     */
    public function indexOf(item:T, arr:Null<Array<T>>):Int;
}
