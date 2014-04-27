package hxsearch.tests;

/**
 * TestSuite runner for classes in hxsearch package.
 */
class Runner
{
    public static function main():Void
    {
        var r = new haxe.unit.TestRunner();

        // hxsearch.algorithms package
        r.add( new hxsearch.tests.algorithms.TestBinarySearch() );
        r.add( new hxsearch.tests.algorithms.TestLinearSearch() );

        var success:Bool = r.run();

        #if sys
            Sys.exit(success ? 0 : 1);
        #end
    }
}
