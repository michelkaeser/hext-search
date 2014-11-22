package hext.search.array;

import hext.search.array.ArraySearchAlgorithm;
import hext.utils.Comparator;

/**
 * This class is an implementation of "Binary Search" algorithm.
 *
 * @link http://en.wikipedia.org/wiki/Binary_search_algorithm
 */
class BinarySearch<T> extends ArraySearchAlgorithm<T>
{
    /**
     * Constructor to initialize a new BinarySearch instance.
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
        var first:Int = 0;
        var last:Int  = arr.length - 1;
        while (last >= first) {
            var middle:Int = Std.int((first + last) / 2);
            var ret:Int    = this.comparator(arr[middle], item);
            if (ret < 0) {
                first = middle + 1;
            } else if (ret > 0) {
                last = middle - 1;
            } else {
                return middle;
            }
        }

        return -1;
    }
}
