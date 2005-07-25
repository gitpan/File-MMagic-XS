#!perl
use strict;
use Test::More (tests => 4);

BEGIN
{
    use_ok("File::MMagic::XS");
}

my $file = __FILE__;
my %map = (
    $file             => 'text/plain',
    't/data/test.xml' => 'text/xml',
    't/data/test.rtf' => 'application/rtf'
);

my $fm = File::MMagic::XS->new;

while (my($file, $mime) = each %map) {
    my $got = $fm->get_mime($file);
    is($got, $mime, "$file: expected $mime");

#    ok(open(F, $file), "ok to open $file");
#    is($fm->fhmagic(\*F), $mime, "$file: expected $mime from fhmagic");
}
