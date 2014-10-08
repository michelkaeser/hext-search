package search.array;

import lib.util.Comparator;
import search.array.ArraySearchAlgorithm;

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
     * @param lib.util.Comparator<T> comparator the Comparator to use
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
        var first:Int = 0,
            last:Int  = arr.length - 1;

        var middle:Int;
        while (last >= first) {
            middle = Std.int((first + last) / 2);
            var ret:Int = this.comparator(arr[middle], item);
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
