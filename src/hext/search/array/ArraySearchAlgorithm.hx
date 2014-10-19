package hext.search.array;

import hext.NotImplementedException;
import hext.search.array.IArraySearchAlgorithm;
import hext.util.Comparator;

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
     * @param hext.util.Comparator<T> comparator the Comparator to use
     */
    private function new(comparator:Comparator<T>):Void
    {
        this.comparator = comparator;
    }

    /**
     * @{inherit}
     */
    public function indexOf(item:T, arr:Null<Array<T>>):Int
    {
        if (arr != null && arr.length != 0) {
            return this._indexOf(item, arr);
        }

        return -1;
    }

    /**
     * TODO
     *
     * @abstract
     *
     * @throws hext.NotImplementedException since the method is abstract and needs to be overriden by subclasses
     */
    private function _indexOf(item:T, arr:Array<T>):Int
    {
        throw new NotImplementedException("Method _indexOf() not implemented in abstract class ArraySearchAlgorithm.");
    }
}
