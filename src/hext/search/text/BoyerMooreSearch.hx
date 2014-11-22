package hext.search.text;

import haxe.ds.IntMap;
import hext.search.text.TextSearchAlgorithm;

using StringTools;

/**
 * Boyer-Moore algorithm implementation.
 *
 * @link http://en.wikipedia.org/wiki/Boyer-Moore_string_search_algorithm
 */
class BoyerMooreSearch extends TextSearchAlgorithm
{
    /**
     * Stores the map where we store occurrences (the position)
     * of characters from and in the search pattern.
     *
     * @var haxe.ds.IntMap<Int>
     */
    private var occurrences:IntMap<Int>;


    /**
     * Constructor to initialize a new BoyerMoore instance.
     *
     * @param String pattern the pattern to look for
     */
    public function new(pattern:String):Void
    {
        this.occurrences = new IntMap<Int>();
        super(pattern);
    }

    /**
     * @{inherit}
     */
    override private function _indexIn(text:String):Int
    {
        var i:Int = 0;
        while (i < text.length) {
            var j:Int = this.pattern.length - 1;
            while (j >= 0 && text.fastCodeAt(i + j) == this.pattern.fastCodeAt(j)) {
                --j;
            }
            if (j != -1) {
                var p:Null<Int> = this.occurrences.get(text.fastCodeAt(i + j));
                if (p == null) {
                    i = i + j + 1;
                } else if (p < j) {
                    i = i + j - p;
                } else {
                    ++i;
                }
            } else {
                return i;
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
        for (i in 0...pattern.length) {
            this.occurrences.set(pattern.fastCodeAt(i), i);
        }

        return pattern;
    }
}
