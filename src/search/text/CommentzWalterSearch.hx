package search.text;

import lib.NotImplementedException;
import search.text.TextSearchAlgorithm;

/**
 *
 * @link http://en.wikipedia.org/wiki/Commentz-Walter_algorithm
 */
class CommentzWalterSearch extends TextSearchAlgorithm
{
    /**
     * Constructor to initialize a new CommentzWalter instance.
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
    override public function index(text:String):Int
    {
        throw new NotImplementedException();
    }

    /**
     * @{inherit}
     */
    override private function set_pattern(pattern:String):String
    {
        return super.set_pattern(pattern);
    }
}
