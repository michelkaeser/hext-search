package hxsearch.text;

import hxsearch.text.TextSearchAlgorithm;
import hxstd.NotImplementedException;

/**
 * Rabin-Karp algorithm implementation.
 *
 * @link http://en.wikipedia.org/wiki/Rabin-Karp_string_search_algorithm
 * @link http://www.geeksforgeeks.org/searching-for-patterns-set-3-rabin-karp-algorithm/
 */
class RabinKarpSearch extends TextSearchAlgorithm
{
    /**
     * Stores the number of characters in input alphabet.
     *
     * @var Int
     */
    private static inline var D:Int = 256;

    /**
     * Stores the prime number used in hash function.
     *
     * @var Int
     */
    private static inline var Q:Int = 101;

    /**
     * Stores the patterns hash value.
     *
     * @var Int
     */
    private var hash:Int;


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
    override public function index(text:String):Int
    {
        if (text != null && text.length >= this.pattern.length) {
            var m:Int = this.pattern.length,
                n:Int = text.length,
                t:Int = 0,
                h:Int = 1;

            for (i in 0...m - 1) {
                h = (h * RabinKarpSearch.D) % RabinKarpSearch.Q;
            }
            for (i in 0...m) {
                t = (RabinKarpSearch.D * t + text.charCodeAt(i)) % RabinKarpSearch.Q;
            }

            var i:Int = 0;
            while (i <= n - m) {
                if (this.hash == t) {
                    var j:Int = 0;
                    while (j < m) {
                        if (text.charAt(i + j) != this.pattern.charAt(j)) {
                            break;
                        }
                        ++j;
                    }
                    if (j == m) {
                        return i;
                    }
                }
                if (i < n - m) {
                    t = (RabinKarpSearch.D * (t - text.charCodeAt(i) * h) + text.charCodeAt(i + m)) % RabinKarpSearch.Q;
                    if (t < 0) {
                        t = (t + RabinKarpSearch.Q);
                    }
                }
                ++i;
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

        this.hash = 0;
        for (i in 0...pattern.length) {
            this.hash = (RabinKarpSearch.D * this.hash + pattern.charCodeAt(i)) % RabinKarpSearch.Q;
        }

        return pattern;
    }
}
