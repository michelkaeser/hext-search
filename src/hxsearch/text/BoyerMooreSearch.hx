package hxsearch.text;

import haxe.ds.Vector;
import hxsearch.text.TextSearchAlgorithm;

/**
 * Boyer-Moore algorithm implementation.
 *
 * @link http://en.wikipedia.org/wiki/Boyer-Moore_string_search_algorithm
 * @link https://weblogs.java.net/blog/potty/archive/2012/05/21/string-searching-algorithms-part-iii
 */
class BoyerMooreSearch extends TextSearchAlgorithm
{
    /**
     * Stores the number of characters in input alphabet.
     *
     * @var Int
     */
    private static inline var D:Int = 256;

    /**
     * Stores the Vector of character occurrences.
     *
     * @var Vector<Int>
     */
    private var occurrences:Vector<Int>;


    /**
     * Constructor to initialize a new BoyerMoore instance.
     *
     * @param String pattern the pattern to use
     */
    public function new(pattern:String):Void
    {
        this.occurrences = new Vector<Int>(BoyerMooreSearch.D);
        super(pattern);
    }

    /**
     * @{inherit}
     */
    override public function index(text:String):Int
    {
        if (text != null && text.length >= this.pattern.length) {
            var n:Int = text.length,
                m:Int = this.pattern.length;

            var i:Int = 0,
                skip:Int;
            while (i <= n - m) {
                skip = 0;
                var j:Int = m - 1;
                while (j >= 0) {
                    if (this.pattern.charAt(j) != text.charAt(i + j)) {
                        skip = Std.int( Math.max(1, j - this.occurrences[text.charCodeAt(i + j)]) );
                        break;
                    }
                    --j;
                }
                if (skip == 0) {
                    return i;
                }
                i += skip;
            }
        }

        return -1;
    }

    /**
     * @{inherit}
     */
    override private function set_pattern(pattern:String):String
    {
        super.set_pattern(pattern);

        for (i in 0...BoyerMooreSearch.D) {
            this.occurrences[i] = -1;
        }
        for (i in 0...this.pattern.length) {
            this.occurrences[this.pattern.charCodeAt(i)] = i;
        }

        return pattern;
    }
}
