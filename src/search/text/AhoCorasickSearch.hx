package search.text;

import haxe.ds.Vector;
import lib.Char;
import lib.NotImplementedException;
import search.text.TextSearchAlgorithm;

using StringTools;

/**
 * Aho-Corasick algorithm implementation.
 *
 * @link http://en.wikipedia.org/wiki/Aho-Corasick_string_matching_algorithm
 * @link https://sites.google.com/site/indy256/algo/aho_corasick
 */
class AhoCorasickSearch extends TextSearchAlgorithm
{
    /**
     * Stores the nodes the algorithm uses to represent text.
     *
     * @var haxe.ds.Vector<search.text.AhoCarosickSearch.Node>
     */
    private var nodes:Vector<Node>;

    /**
     * Stores the number of node items.
     *
     * @var Int
     */
    private var count:Int;


    /**
     * Constructor to initialize a new AhoCarosick instance.
     *
     * @param String pattern the pattern to use
     */
    public function new(pattern:String):Void
    {
        super(pattern);
    }

    /**
     * @{inherit}
     */
    override private function _indexIn(text:String):Int
    {
        var index:Int = 0;
        var node:Int  = 0;
        for (i in 0...text.length) {
            node = this.transition(node, text.fastCodeAt(i));
            if (this.nodes[node].leaf) {
                return index - this.nodes[node].parent;
            }
            ++index;
        }

        return -1;
    }

    /**
     * Initializes the pattern nodes.
     */
    public function initNodes():Void
    {
        var cur:Int = 0;
        for (i in 0...this.pattern.length) {
            var ch:Int = this.pattern.fastCodeAt(i);
            if (this.nodes[cur].children[ch] == -1) {
                this.nodes[this.count] = new Node();
                this.nodes[this.count].parent = cur;
                this.nodes[this.count].charFromParent = ch;
                this.nodes[cur].children[ch] = this.count++;
            }
            cur = this.nodes[cur].children[ch];
        }

        this.nodes[cur].leaf = true;
    }

    /**
     * @{inherit}
     */
    override private function set_pattern(pattern:String):String
    {
        super.set_pattern(pattern);

        this.nodes    = new Vector<Node>(pattern.length + 1);
        var node:Node = new Node();
        node.suffLink = 0;
        node.parent   = -1;
        this.nodes[0] = node;
        this.count    = 1;
        this.initNodes();

        return this.pattern;
    }

    /**
     * Returns the suffix link for the node at index 'index'.
     *
     * @param Int index the index of the node to check
     *
     * @return Int
     */
    private function suffLink(index:Int):Int
    {
        var node:Node = this.nodes[index];
        if (node.suffLink == -1) {
            node.suffLink = (node.parent == 0) ? 0 : this.transition(this.suffLink(node.parent), node.charFromParent);
        }

        return node.suffLink;
    }

    /**
     *
     */
    private function transition(index:Int, ch:Int):Int
    {
        var node:Node = this.nodes[index];
        if (node.transitions[ch] == -1) {
            node.transitions[ch] = (node.children[ch] != -1) ? node.children[ch] : (index == 0 ? 0 : this.transition(this.suffLink(index), ch));
        }

        return node.transitions[ch];
    }
}


/**
 * Internal node class.
 */
private class Node
{
    /**
     * Stores the number of characters in input alphabet.
     *
     * @var Int
     */
    public static inline var D:Int = 256;

    public var parent:Int;
    public var charFromParent:Int;
    public var suffLink:Int;
    public var leaf:Bool;
    public var children:Vector<Int>;
    public var transitions:Vector<Int>;


    public function new():Void
    {
        this.parent         = 0;
        this.charFromParent = 0;
        this.suffLink       = -1;
        this.leaf           = false;
        this.children       = new Vector<Int>(Node.D);
        this.transitions    = new Vector<Int>(Node.D);

        for (i in 0...Node.D) {
            this.children[i]    = -1;
            this.transitions[i] = -1;
        }
    }
  }
