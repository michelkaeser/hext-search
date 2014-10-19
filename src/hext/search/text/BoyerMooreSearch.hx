package hext.search.text;

import haxe.ds.Vector;
import hext.search.text.TextSearchAlgorithm;

using StringTools;

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
     * @var haxe.ds.Vector<Int>
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
    override private function _indexIn(text:String):Int
    {
        var n:Int = text.length,
            m:Int = this.pattern.length;

        var i:Int = 0,
            skip:Int;
        while (i <= n - m) {
            skip = 0;
            var j:Int = m - 1;
            while (j >= 0) {
                if (this.pattern.fastCodeAt(j) != text.fastCodeAt(i + j)) {
                    skip = Std.int( Math.max(1, j - this.occurrences[text.fastCodeAt(i + j)]) );
                    break;
                }
                --j;
            }
            if (skip == 0) {
                return i;
            }
            i += skip;
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
            this.occurrences[this.pattern.fastCodeAt(i)] = i;
        }

        return pattern;
    }
}
