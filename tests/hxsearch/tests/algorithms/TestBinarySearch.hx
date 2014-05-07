package hxsearch.tests.algorithms;

import hxsearch.tests.algorithms.AbstractSearchTest;

/**
 * TestSuite for the hxsearch.algorithms.BinarySearch class.
 */
class TestBinarySearch extends AbstractSearchTest
{
    /**
     * Ensures the search() method doesn't throw an Exception when an empty Array is passed.
     * This should be ensured by search() being just a wrapper around internalSearch() with
     * arr.length == 0 check.
     */
    public function testWorksWithEmptyArray():Void
    {
        try {
            var found:Bool = hxsearch.algorithms.BinarySearch.search([], 4, Reflect.compare);
            assertFalse(found);
        } catch (ex:Dynamic) {
            assertFalse(true);
        }
    }

    /**
     * Ensures the search() method works.
     *
     * Attn: This test assumes the Reflect.compare method is correctly implemented.
     * Make sure it works before checking for errors in the algorithm.
     */
    public function testSearch():Void
    {
        var found:Bool = hxsearch.algorithms.BinarySearch.search(this.arr, 4, Reflect.compare);
        assertTrue(found);

        found = hxsearch.algorithms.BinarySearch.search(this.arr, 10, Reflect.compare);
        assertFalse(found);
    }
}
