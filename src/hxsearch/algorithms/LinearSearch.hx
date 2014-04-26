package hxsearch.algorithms;

import hxstd.util.Comparator;
import hxsearch.SearchAlgorithm;

/**
 * This class is an implementation of "Linear Search with Guard" algorithm.
 *
 * @link http://en.wikipedia.org/wiki/Linear_search
 */
class LinearSearch implements SearchAlgorithm
{
    /**
     * @{inherit}
     */
    public static function search<T>(arr:Array<T>, item:T, comparator:Comparator<T>):Bool
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
