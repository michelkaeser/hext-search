package hext.search.array;

import hext.search.array.ArraySearchAlgorithm;
import hext.utils.Comparator;

/**
 * This class is an implementation of "Linear Search with Guard" algorithm.
 *
 * @link http://en.wikipedia.org/wiki/Linear_search
 */
class LinearSearch<T> extends ArraySearchAlgorithm<T>
{
    /**
     * Constructor to initialize a new LinearSearch instance.
     *
     * @param hext.utils.Comparator<T> comparator the Comparator to use
     */
    public function new(comparator:Comparator<T>):Void
    {
        super(comparator);
    }

    /**
     * @{inherit}
     */
    override private function _indexOf(item:T, arr:Array<T>):Int
    {
        var index:Int = -1;
        var last:Int  = arr.length - 1;
        if (this.comparator(arr[last], item) == 0) {
            index = last;
        } else {
            var tmp:T = arr[last];
            var j:Int = 0;
            arr[last] = item;
            while (this.comparator(arr[j], item) != 0) {
                ++j;
            }
            index = (j < last) ? j : -1;
            arr[last] = tmp;
        }

        return index;
    }
}
