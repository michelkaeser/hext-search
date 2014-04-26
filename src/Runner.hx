import hxsearch.Algorithm;
import hxsearch.Searcher;
import hxstd.util.Reflector;

class Runner
{
    public static function main():Void
    {
        var arr:Array<Int> = new Array<Int>();
        for (i in 0...2500) {
            arr.push(Std.int( Math.random()*10000 ));
        }
        trace("Generated randoms...");

        var copy = arr.copy();
        var start = haxe.Timer.stamp();
        Lambda.has(copy, 5);
        var duration = haxe.Timer.stamp() - start;
        trace("Lambda.has:   " + duration);

        var searcher = new Searcher<Int>(Algorithm.BINARY_SEARCH, Reflector.compare);
        copy = arr.copy();
        copy.sort(Reflector.compare); // "fakes" the result but is needed
        start = haxe.Timer.stamp();
        searcher.search(copy, 5);
        duration = haxe.Timer.stamp() - start;
        trace("BinarySearch: " + duration);

        var searcher = new Searcher<Int>(Algorithm.LINEAR_SEARCH, Reflector.compare);
        var copy = arr.copy();
        var start = haxe.Timer.stamp();
        searcher.search(copy, 5);
        var duration = haxe.Timer.stamp() - start;
        trace("LinearSearch: " + duration);
    }
}
