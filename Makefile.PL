# $Id: /local/perl/File-MMagic-XS/trunk/Makefile.PL 13058 2007-07-08T23:05:49.631249Z daisuke  $
#
# Daisuke Maki <daisuke@endeworks.jp>
# All rights reserved.

use 5.006001;
use ExtUtils::MakeMaker;

my %INFO = (
    ABSTRACT     => 'Guess File Type With XS (a la mod_mime_magic)',
    AUTHOR       => 'Daisuke Maki <daisuke@endeworks.jp>',
    NAME         => 'File::MMagic::XS',
    VERSION_FROM => 'lib/File/MMagic/XS.pm',
    OBJECT       => '$(O_FILES)',
    LICENSE      => "perl",
);

WriteMakefile(%INFO);