package hxsearch.tests.algorithms;

/**
 * Abstract test class to be extended by algorithm test suites.
 */
class AbstractSearchTest extends haxe.unit.TestCase
{
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
}
