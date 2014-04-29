package hxsearch;

import hxstd.Exception;
import hxstd.util.Comparator;
import hxsearch.SearchAlgorithm;
import hxsearch.algorithms.*;
import hxsearch.algorithms.BinarySearch;
import hxsearch.algorithms.LinearSearch;
import hxsearch.algorithms.SearchAlgorithm;

/**
 * Generic wrapper class around the various searching algorithm implementations.
 *
 * @generic T the type of items to search
 */
class Searcher<T>
{
    /**
     * Stores the algorithm class with which to search.
     *
     * @var Class<Dynamic>
     */
    private var algorithm:Class<Dynamic>;

    /**
     * Stores the search() method object of the algorithm class.
     *
     * @var Dynamic
     */
    private var method:Dynamic;

    /**
     * Stores the Comparator used to compare items in the Array.
     *
     * @var hxstd.util.Comparator<T>
     */
    private var comparator:Comparator<T>;


    /**
     * Constructor to initialize a new Searcher.
     *
     * @param hxsearch.SearchAlgorithm algorithm the algorithm to use
     */
    public function new(algorithm:SearchAlgorithm, comparator:Comparator<T>):Void
    {
        this.algorithm  = Type.resolveClass(cast algorithm);
        this.method     = Reflect.field(this.algorithm, "search");
        this.comparator = comparator;
    }

    /**
     * Searchs the Array for the given item.
     *
     * @param Array<T> arr  the Array to search in
     * @param T        item the item to search
     *
     * @return Bool true if found
     */
    public function search(arr:Array<T>, item:T):Bool
    {
        if (arr != null && arr.length != 0) {
            return Reflect.callMethod(this.algorithm, this.method, [arr, item, comparator]);
        }

        return false;
    }
}
