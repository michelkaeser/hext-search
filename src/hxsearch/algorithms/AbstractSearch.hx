package hxsearch.algorithms;

import hxstd.util.Comparator;
import hxsearch.SearchAlgorithm;

/**
 * Abstract searching algorithm base class to be extended by
 * complex searching algorithms with deep recursion or lot of internal method calling.
 *
 * We use instances instead of pure static classes since passing references in-and-out
 * may be to expensive.
 *
 * @generic T the type of items to search
 */
class AbstractSearch<T> implements SearchAlgorithm
{
    /**
     * Stores the Array to search in.
     *
     * @var Array<T>
     */
    private var arr:Array<T>;

    /**
     * Stores the Comparator used to compare the Array items.
     *
     * @var hxstd.util.Comparator<T>
     */
    private var comparator:Comparator<T>;


    /**
     * Constructor to initialize a new AbstractSearch instance.
     *
     * @param Array<T>                 arr        the Array to search in
     * @param hxstd.util.Comparator<T> comparator the Comparator to use
     */
    private function new(arr:Array<T>, comparator:Comparator<T>):Void
    {
        this.arr        = arr;
        this.comparator = comparator;
    }
}
