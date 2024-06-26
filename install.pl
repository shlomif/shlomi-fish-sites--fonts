#! /usr/bin/env perl

# Copyright (c) 2020 Shlomi Fish ( https://www.shlomifish.org/ )
# Author: Shlomi Fish ( https://www.shlomifish.org/ )
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my $LOCAL = ( @ARGV ? ( shift(@ARGV) eq "--local" ) : 0 );
my $HOME  = $ENV{HOME};
my $fonts_dir =
    path($HOME)->child( $LOCAL ? ( ".local", "share", "fonts" ) : (".fonts") );
$fonts_dir->mkpath();
foreach my $font ( cwd()->children(qr/\.ttf\z/) )
{
    say $font;
    $font->copy( $fonts_dir->child( $font->basename() ) );
}

