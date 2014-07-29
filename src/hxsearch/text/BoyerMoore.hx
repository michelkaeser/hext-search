package hxsearch.text;

import haxe.ds.StringMap;
import haxe.ds.Vector;
import hxsearch.text.TextSearchAlgorithm;

/**
 *
 * @link http://en.wikipedia.org/wiki/Boyer-Moore_string_search_algorithm
 * @link http://java.dzone.com/articles/algorithm-week-boyer-moore
 */
class BoyerMoore extends TextSearchAlgorithm
{
    /**
     * Stores the map of bad characters.
     *
     * @var StringMap<String, Int>
     */
    private var badChars:StringMap<Int>;

    /**
     * Stores the Vector of good suffixes.
     *
     * @var Vector<Int>
     */
    private var goodSuffixes:Vector<Int>;


    /**
     * Constructor to initialize a new BoyerMoore instance.
     *
     * @param String pattern the pattern to use
     */
    public function new(pattern:String):Void
    {
        super(pattern);
    }

    /**
     * Returns the calculated suffixes for the search pattern.
     *
     * @return Vector<Int>
     */
    private function getSuffixes():Vector<Int>
    {
        var end:Int      = this.pattern.length,
            g:Int        = end - 1;

        var suffixes:Vector<Int> = new Vector<Int>(this.pattern.length);
        suffixes[g] = end;

        var i:Int = end - 2,
            f:Int = 0;
        while (i >= 0) {
            var tmp:Int = i + end - 1 - f;
            if (i > g && suffixes[tmp] < i - g) {
                suffixes[i] = suffixes[tmp];
            } else {
                if (i < g) {
                    g = i;
                }
                f = i;

                while (g >= 0 && this.pattern.charAt(g) == this.pattern.charAt(g + end - 1 - f)) {
                    --g;
                }
                suffixes[i] = f - g;
            }
            --i;
        }

        return suffixes;
    }

    /**
     * @{inherit}
     */
    override public function indexIn(text:String):Int
    {
        if (text != null) {
            var length:Int = this.pattern.length,
                j:Int = 0;

            while (j <= text.length - length) {
                var i:Int = length - 1;
                while (i >= 0 && this.pattern.charAt(i) == text.charAt(i + j)) {
                    --i;
                }
                if (i < 0) {
                    return j;
                } else {
                    var tmp:Int = i + j;
                    if (this.badChars.get(text.charAt(tmp)) == null) {
                        this.badChars.set(text.charAt(tmp), 0);
                    }
                    j += Std.int( Math.max(this.goodSuffixes[i], this.badChars.get(text.charAt(tmp)) - length + i + 1) );
                }
            }
        }

        return -1;
    }

    /**
     * @{inherit}
     */
    override public function indexesIn(text:String):Array<Int>
    {
        var indexes:Array<Int> = new Array<Int>();

        if (text != null) {
            var length:Int = this.pattern.length,
                j:Int = 0;

            while (j <= text.length - length) {
                var i:Int = length - 1;
                while (i >= 0 && this.pattern.charAt(i) == text.charAt(i + j)) {
                    --i;
                }
                if (i < 0) {
                    indexes.push(j);
                    j += this.goodSuffixes[0];
                } else {
                    var tmp:Int = i + j;
                    if (this.badChars.get(text.charAt(tmp)) == null) {
                        this.badChars.set(text.charAt(tmp), 0);
                    }
                    j += Std.int( Math.max(this.goodSuffixes[i], this.badChars.get(text.charAt(tmp)) - length + i + 1) );
                }
            }
        }

        return indexes;
    }

    /**
     * Initializes the map of bad characters.
     */
    private function initBadChars():Void
    {
        var end:Int = this.pattern.length;
        for (i in 0...end - 1) {
            this.badChars.set(this.pattern.charAt(i), end - i - 1);
        }
    }

    /**
     * Initializes the Vector of good suffixes.
     */
    private function initGoodSuffixes():Void
    {
        var end:Int = this.pattern.length;
        for (i in 0...end) {
            this.goodSuffixes[i] = end;
        }

        var suffixes:Vector<Int> = this.getSuffixes();
        var i:Int = end - 1;
        while (i >= 0) {
            if (suffixes[i] == i + 1) {
                var tmp:Int = end - i - 1;
                for (j in 0...tmp) {
                    if (this.goodSuffixes[j] == end) {
                        this.goodSuffixes[j] = tmp;
                    }
                }
            }
            --i;
        }

        for (i in 0...(end - 2)) {
            this.goodSuffixes[end - 1 - suffixes[i]] = end - i - 1;
        }
    }

    /**
     * @{inherit}
     */
    override private function set_pattern(pattern:String):String
    {
        super.set_pattern(pattern);

        this.badChars     = new StringMap<Int>();
        this.goodSuffixes = new Vector<Int>(pattern.length);
        this.initBadChars();
        this.initGoodSuffixes();

        return pattern;
    }
}
