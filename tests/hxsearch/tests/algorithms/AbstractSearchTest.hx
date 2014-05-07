package hxsearch.tests.algorithms;

/**
 * Abstract test class to be extended by algorithm test suites.
 */
class AbstractSearchTest extends haxe.unit.TestCase
{
    /**
     * Stores the algorithm used to search the Array.
     *
     * @var hxsearch.algorithms.TSearchAlgorithm
     */
    private var algorithm:hxsearch.algorithms.TSearchAlgorithm;

    /**
     * Stores the Array that is searched.
     *
     * @var Array<Int>
     */
    private var arr:Array<Int>;


    /**
     * @{inherit}
     */
    override public function setup():Void
    {
        this.arr = [7, 2, 9, 3, 4, 1, 8, 5, 6];
    }

    /**
     *@{inherit}
     */
    override public function tearDown():Void
    {
        this.arr = null;
    }


    /**
     * Ensures the search() method works.
     *
     * Attn: This test assumes the Reflect.compare method is correctly implemented.
     * Make sure it works before checking for errors in the algorithm.
     */
    public function testSearch():Void
    {
        var found:Bool = this.algorithm.search(this.arr, 4, Reflect.compare);
        assertTrue(found);

        found = this.algorithm.search(this.arr, 10, Reflect.compare);
        assertFalse(found);
    }

    /**
     * Ensures the search() method doesn't throw an Exception when an empty Array is passed.
     * This should be ensured by search() being just a wrapper around internalSearch() with
     * arr.length == 0 check.
     */
    public function testWorksWithEmptyArray():Void
    {
        try {
            var found:Bool = this.algorithm.search([], 4, Reflect.compare);
            assertFalse(found);
        } catch (ex:Dynamic) {
            assertFalse(true);
        }
    }
}
