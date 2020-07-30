#! /usr/bin/env perl
#
# Short description for install.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.0.1
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

my $HOME = $ENV{HOME};
my $fonts_dir = path($HOME)->child(".fonts");
$fonts_dir->mkpath();
foreach my $font (cwd()->children(qr/\.ttf\z/))
{
    say $font;
    $font->copy($fonts_dir->child($font->basename()));
}

