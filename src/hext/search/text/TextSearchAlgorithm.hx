package hext.search.text;

import hext.NotImplementedException;
import hext.search.text.ITextSearchAlgorithm;

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
     */
    public function indexIn(text:Null<String>):Int
    {
        if (text != null && text.length >= this.pattern.length) {
            return this._indexIn(text);
        }

        return -1;
    }

    /**
     * TODO
     *
     * @abstract
     *
     * @throws hext.NotImplementedException since the method is abstract and to be overriden in subclasses
     */
    private function _indexIn(text:Null<String>):Int
    {
        throw new NotImplementedException("Method _indexOf() not implemented in abstract class TextSearchAlgorithm.");
    }

    /**
     * @{inherit}
     */
    public function indexesIn(text:Null<String>):Array<Int>
    {
        var indexes:Array<Int> = new Array<Int>();
        if (text != null) {
            var length:Int = this.pattern.length;
            var index:Int  = this.indexIn(text);
            while (index != -1) {
                if (indexes.length != 0) {
                    index += indexes[indexes.length - 1] + length;
                }
                indexes.push(index);
                index = this.indexIn(text.substring(index + length));
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
