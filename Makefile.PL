# $Id: /mirror/perl/File-MMagic-XS/trunk/Makefile.PL 7110 2007-05-08T22:31:53.024242Z daisuke  $
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
);

WriteMakefile(%INFO);