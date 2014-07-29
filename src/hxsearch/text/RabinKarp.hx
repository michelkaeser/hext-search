package hxsearch.text;

import hxsearch.text.TextSearchAlgorithm;

/**
 *
 * @link http://en.wikipedia.org/wiki/Rabin-Karp_string_search_algorithm
 */
class RabinKarp extends TextSearchAlgorithm
{
    /**
     * Constructor to initialize a new RabinKarp instance.
     *
     * @param String pattern the pattern to use
     */
    public function new(pattern:String):Void
    {
        super(pattern);
    }

    /**
     * @{inherit}
     */
    override public function position(text:String):Int
    {
        return -1;
    }

    /**
     * @{inherit}
     */
    override private function set_pattern(pattern:String):String
    {
        return super.set_pattern(pattern);
    }
}
