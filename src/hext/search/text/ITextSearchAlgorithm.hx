package hext.search.text;

/**
 * Text search algorithm interface to be implemented.
 */
interface ITextSearchAlgorithm
{
    /**
     * Stores the pattern the algorithm is looking for.
     *
     * @var String
     */
    @:isVar public var pattern(get, set):String;


    /**
     * Returns the index of the pattern within the text.
     *
     * If the pattern is not found, -1 is returned.
     *
     * @param Null<String> text the text to search in
     *
     * @return Int the position within the text where the pattern match starts
     */
    public function indexIn(text:Null<String>):Int;

    /**
     * Returns an Array containing all indexes (starting positions) at which the pattern was found.
     *
     * If the pattern does not match, an empty Array is returned.
     *
     * @param Null<String> text the text to search in
     *
     * @return Array<Int> the Array of indexes
     */
    public function indexesIn(text:Null<String>):Array<Int>;
}
