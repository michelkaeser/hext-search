package hxsearch.algorithms;

import hxstd.util.Comparator;

/**
 * This class is an implementation of "Linear Search with Guard" algorithm.
 *
 * @link http://en.wikipedia.org/wiki/Linear_search
 */
class LinearSearch
{
    /**
     * @{inherit}
     */
    public static function search<T>(arr:Array<T>, item:T, comparator:Comparator<T>):Bool
    {
        if (arr.length != 0) {
            return LinearSearch.internalSearch(arr, item, comparator);
        }

        return false;
    }

    /**
     * @{inherit}
     */
    public static function internalSearch<T>(arr:Array<T>, item:T, comparator:Comparator<T>):Bool
    {
        var found:Bool = false;
        var last:Int   = arr.length - 1;
        if (comparator(arr[last], item) == 0) {
            found = true;
        } else {
            var tmp:T = arr[last];
            var j:Int = 0;
            arr[last] = item;
            while (comparator(arr[j], item) != 0) ++j;
            found = j < last;
            arr[last] = tmp;
        }

        return found;
    }
}
