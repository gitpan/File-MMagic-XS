#!perl
use strict;
use Test::More;
my %map;
BEGIN
{
    my $file = __FILE__;
    %map = (
        $file             => 'text/plain',
        't/data/test.xml' => 'text/xml',
        't/data/test.rtf' => 'application/rtf'
    );
    plan(tests => scalar( keys %map ) * 3 + 1);
}

BEGIN
{
    use_ok("File::MMagic::XS");
}


my $fm = File::MMagic::XS->new;

while (my($file, $mime) = each %map) {
    my $got = $fm->get_mime($file);
    is($got, $mime, "$file: expected $mime");

    ok(open(F, $file), "ok to open $file");
    is($fm->fhmagic(\*F), $mime, "$file: expected $mime from fhmagic");
}
