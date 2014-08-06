package hxsearch.text;

import hxsearch.text.ITextSearchAlgorithm;
import hxstd.NotImplementedException;

/**
 * Abstract text search algorithm implementation.
 *
 * @abstract
 */
class TextSearchAlgorithm implements ITextSearchAlgorithm
{
    /**
     * @{inherit}
     */
    @:isVar public var pattern(get, set):String;


    /**
     * Constructor to initialize a new TextSearchAlgorithm instance.
     *
     * @param String pattern the pattern to use
     */
    private function new(pattern:String):Void
    {
        this.pattern = pattern;
    }

    /**
     * Internal getter method for the 'pattern' property.
     *
     * @return String
     */
    private function get_pattern():String
    {
        return this.pattern;
    }

    /**
     * @{inherit}
     *
     * @throws hxstd.NotImplementedException since the method is abstract and to be overriden in subclasses
     */
    public function index(text:String):Int
    {
        throw new NotImplementedException("Method index() not implemented in abstract class TextSearchAlgorithm");
    }

    /**
     * @{inherit}
     */
    public function indexes(text:Null<String>):Array<Int>
    {
        var indexes:Array<Int> = new Array<Int>();

        if (text != null) {
            var length:Int = this.pattern.length,
                index:Int  = this.index(text);
            while (index != -1) {
                if (indexes.length != 0) {
                    index += indexes[indexes.length - 1] + length;
                }
                indexes.push(index);
                index = this.index(text.substring(index + length));
            }
        }

        return indexes;
    }

    /**
     * Internal setter method for the 'pattern' property.
     *
     * @param String pattern the pattern to set
     *
     * @return String the new pattern
     */
    private function set_pattern(pattern:String):String
    {
        return this.pattern = pattern;
    }
}
