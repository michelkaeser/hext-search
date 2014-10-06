package search.tests;

#if cpp
    import mcover.coverage.MCoverage;
    import mcover.coverage.CoverageLogger;
#end
import haxe.unit.TestRunner;

/**
 * TestSuite runner for classes in hxsearch package.
 */
class Runner
{
    public static function main():Void
    {
        var r = new TestRunner();

        var success:Bool = r.run();
        #if cpp
            MCoverage.getLogger().report();
        #end

        #if sys
            Sys.exit(success ? 0 : 1);
        #end
    }
}
