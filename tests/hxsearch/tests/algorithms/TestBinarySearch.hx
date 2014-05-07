package hxsearch.tests.algorithms;

import hxsearch.tests.algorithms.AbstractSearchTest;

/**
 * TestSuite for the hxsearch.algorithms.BinarySearch class.
 */
class TestBinarySearch extends AbstractSearchTest
{
    /**
     * @{inherit}
     */
    public function new():Void
    {
        super();
        this.algorithm = cast hxsearch.algorithms.BinarySearch;
    }
}
