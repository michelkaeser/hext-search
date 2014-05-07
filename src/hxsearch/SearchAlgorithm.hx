package hxsearch;

/**
 * Abstract enum defining all available searching algorithm implementations.
 */
@:enum
abstract SearchAlgorithm(String)
{
    var BINARY_SEARCH = "hxsearch.algorithms.BinarySearch";
    var LINEAR_SEARCH = "hxsearch.algorithms.LinearSearch";
}
