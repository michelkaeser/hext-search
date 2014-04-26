package hxsearch.algorithms;

import hxstd.util.Comparator;
import hxsearch.SearchAlgorithm;

/**
 * This class is an implementation of "Binary Search" algorithm.
 *
 * @link http://en.wikipedia.org/wiki/Binary_search_algorithm
 */
class BinarySearch implements SearchAlgorithm
{
    /**
     * Attn: Make sure the Array is sorted (ascending) - otherwise the search will not work!
     *
     * @{inherit}
     */
    public static function search<T>(arr:Array<T>, item:T, comparator:Comparator<T>):Bool
    {
        var first:Int = 0;
        var last:Int  = arr.length - 1;
        var middle:Int;
        while (last >= first) {
            middle = (first + last) >>> 2;
            if (comparator(arr[middle], item) < 0) {
                first = middle + 1;
            } else if (comparator(arr[middle], item) > 0) {
                last = middle - 1;
            } else {
                return true;
            }
        }

        return false;
    }
}
