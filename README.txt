= BirdFeed - A dead simple RSS/Atom reader

BirdFeed is a well tested RSS parsing library that uses the 
Nokogiri XML parser in an attempt to normalize the concept of an 
Atom and RSS feed. We wrote this library to solve the problem of
consuming several different feed types for a moderation tool.

There are a few things that currently suck about BirdFeed: first,
we haven't used this code enough to iron out design flaws. Second,
there documentation is nil. I sacrificed documentation in favor
of spec tests because I was simply too short on time.
 
== LICENSE:

The MIT License

Copyright (c) 2009 Brad Gessler

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
