package hxsearch.tests.algorithms;

import hxsearch.tests.algorithms.AbstractSearchTest;

/**
 * TestSuite for the hxsearch.algorithms.BinarySearch class.
 */
class TestLinearSearch extends AbstractSearchTest
{
    /**
     * Ensures the search() method works.
     *
     * Attn: This test assumes the Reflect.compare method is correctly implemented.
     * Make sure it works before checking for errors in the algorithm.
     */
    public function testSearch():Void
    {
        var found:Bool = hxsearch.algorithms.LinearSearch.search(this.arr, 4 Reflect.compare);
        assertTrue(found);

        found = hxsearch.algorithms.LinearSearch.search(this.arr, 10 Reflect.compare);
        assertFalse(found);
    }
}
