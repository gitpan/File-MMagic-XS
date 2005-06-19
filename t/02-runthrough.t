#!perl
use strict;
use Test::More (tests => 3);

BEGIN
{
    use_ok("File::MMagic::XS");
}

my %map = (
    't/data/test.xml' => 'text/xml',
    't/data/test.rtf' => 'application/rtf'
);

my $fm = File::MMagic::XS->new;

while (my($file, $mime) = each %map) {
    my $got = $fm->get_mime($file);
    is($got, $mime, "$file: expected $mime");
}