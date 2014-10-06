package search.array;

import lib.NotImplementedException;
import lib.util.Comparator;
import search.array.IArraySearchAlgorithm;

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
     * @param lib.util.Comparator<T> comparator the Comparator to use
     */
    private function new(comparator:Comparator<T>):Void
    {
        this.comparator = comparator;
    }

    /**
     * @{inherit}
     *
     * @throws lib.NotImplementedException since the method is abstract and needs to be overriden by subclasses
     */
    public function index(item:T, arr:Array<T>):Int
    {
        throw new NotImplementedException("Method index() not implemented in abstract class ArraySearchAlgorithm.");
    }
}
