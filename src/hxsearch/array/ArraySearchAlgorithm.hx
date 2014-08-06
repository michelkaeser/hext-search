package hxsearch.array;

import hxsearch.array.IArraySearchAlgorithm;
import hxstd.NotImplementedException;
import hxstd.util.Comparator;

/**
 * Abstract Array search algorithm implementation.
 *
 * @abstract
 */
class ArraySearchAlgorithm<T> implements IArraySearchAlgorithm<T>
{
    /**
     * @{inherit}
     */
    public var comparator:Comparator<T>;


    /**
     * Constructor to initialize a new ArraySearchAlgorithm instance.
     *
     * @param hxstd.utils.Comparator<T> comparator the Comparator to use
     */
    private function new(comparator:Comparator<T>):Void
    {
        this.comparator = comparator;
    }

    /**
     * @{inherit}
     *
     * @throws hxstd.NotImplementedException since the method is abstract and needs to be overriden by subclasses
     */
    public function index(item:T, arr:Array<T>):Int
    {
        throw new NotImplementedException("Method index() not implemented in abstract class ArraySearchAlgorithm");
    }
}
