import std.stdio;
import std.math;
import std.algorithm;
import std.conv;
import std.string;
import std.array;

/// return the base representation of the base of a number
/// the base must be less than 10
string toBase(uint num, uint base)
{
	string n;

	uint track = num;
	do
	{
		auto v = track % base;
		//n ~= to!string(v >= 10 ? cast(char)(v+55) : v);
		if (v > 9)
			n ~= cast(char)(v+55);
		else
			n~= to!string(v);
		track = track / base;
	} while (track > 0);

	char[] x = cast(char[])n.dup;
	x.reverse;

	return cast(string)x;
}


void main(string[] args)
{
	if (args.length != 3)
		return;
	
	uint[] cmdLine = args.dup[1..$].map!(a => to!uint(a)).array();
	// uint[] vals = args[1..$].split(" ").map!(a => to!uint(a)).array();
	writeln(toBase(cmdLine[0], cmdLine[1]), " base ", args[2]);
}
