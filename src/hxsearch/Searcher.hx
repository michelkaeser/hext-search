package hxsearch;

import hxstd.Exception;
import hxstd.util.Comparator;
import hxsearch.Algorithm;
import hxsearch.SearchAlgorithm;
import hxsearch.algorithms.*;
import hxsearch.algorithms.BinarySearch;
import hxsearch.algorithms.LinearSearch;

/**
 * Generic wrapper class around the various searching algorithm implementations.
 *
 * @generic T the type of items to sort
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
     * Stores the Comparator used to compare items in the Array.
     *
     * @var hxstd.util.Comparator<T>
     */
    private var comparator:Comparator<T>;


    /**
     * Constructor to initialize a new Searcher.
     *
     * @param hxsort.Algorithm algorithm the algorithm to use
     */
    public function new(algorithm:Algorithm, comparator:Comparator<T>):Void
    {
        this.algorithm = Type.resolveClass(cast algorithm);
        this.comparator = comparator;
    }

    /**
     * Searchs the Array for the given item.
     *
     * @param Array<T> arr  the Array to search in
     * @param T        item the item to search
     *
     * @return Bool true if found
     *
     * @throws hxstd.Exception when no SearchAlgorithm has been defined
     * @throws hxstd.Exception when no Comparator has been defined
     */
    public function search(arr:Array<T>, item:T):Bool
    {
        if (this.algorithm == null) {
            throw new Exception("No SearchAlgorithm defined");
        }
        if (this.comparator == null) {
            throw new Exception("No Comparator defined");
        }

        if (arr != null) {
            return Reflect.callMethod(this.algorithm, Reflect.field(this.algorithm, "search"), [arr, item, comparator]);
        }

        return false;
    }
}
