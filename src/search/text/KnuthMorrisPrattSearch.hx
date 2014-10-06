package search.text;

import haxe.ds.Vector;
import search.text.TextSearchAlgorithm;

using StringTools;

/**
 * Knuth–Morris–Pratt algorithm implementation.
 *
 * @link http://en.wikipedia.org/wiki/Knuth-Morris-Pratt_algorithm
 */
class KnuthMorrisPrattSearch extends TextSearchAlgorithm
{
    /**
     * Stores the jump table used to determinate how many chars can be jumped over.
     *
     * @var haxe.ds.Vector<Int>
     */
    private var jumps:Vector<Int>;


    /**
     * Constructor to initialize a new KnuthMorrisPratt instance.
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
    override public function index(text:Null<String>):Int
    {
        if (text != null && text.length >= this.pattern.length) {
            var t:Int = 0,
                p:Int = 0;

            while (t < text.length) {
                if (p < 0 || text.fastCodeAt(t) == this.pattern.fastCodeAt(p)) {
                    ++t; ++p;
                } else {
                    p = this.jumps[p];
                }

                if (p == this.pattern.length) {
                    return t - this.pattern.length;
                }
            }
        }

        return -1;
    }

    /**
     * Initializes the jump table that is used by the algorithm to determinate how far it can jump
     * each time it misses a match.
     *
     * The jump table needs to be re-calculated each time the pattern changes.
     */
    private function initJumps():Void
    {
        var i:Int     = 0,
            j:Int     = -1;
        this.jumps[i] = j;

        while (i < this.pattern.length - 1) {
            if (j < 0 || this.pattern.fastCodeAt(i) == this.pattern.fastCodeAt(j)) {
                this.jumps[++i] = ++j;
            } else {
                j = this.jumps[j];
            }
        }
    }

    /**
     * @{inherit}
     */
    override private function set_pattern(pattern:String):String
    {
        super.set_pattern(pattern);

        this.jumps = new Vector<Int>(pattern.length);
        for (i in 1...pattern.length) {
            this.jumps[i] = 0;
        }
        this.initJumps();

        return this.pattern;
    }
}
