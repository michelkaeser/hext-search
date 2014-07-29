package hxsearch.text;

import hxsearch.text.ITextSearchAlgorithm;
import hxstd.NotImplementedException;

/**
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
    private inline function get_pattern():String
    {
        return this.pattern;
    }

    /**
     * @{inherit}
     */
    public function indexIn(text:String):Int
    {
        throw new NotImplementedException("Method indexIn() not implemented in abstract class TextSearchAlgorithm");
    }

    /**
     * @{inherit}
     */
    public function indexesIn(text:String):Array<Int>
    {
        throw new NotImplementedException("Method indexesIn() not implemented in abstract class TextSearchAlgorithm");
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
