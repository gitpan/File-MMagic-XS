# $Id: Makefile.PL 2 2005-06-19 08:46:15Z daisuke $
#
# Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

use 5.006001;
use ExtUtils::MakeMaker;

my %INFO = (
    ABSTRACT     => 'Guess File Type With XS (a la mod_mime_magic)',
    AUTHOR       => 'Daisuke Maki <dmaki@cpan.org>',
    NAME         => 'File::MMagic::XS',
    VERSION_FROM => 'lib/File/MMagic/XS.pm',
    OBJECT       => '$(O_FILES)',
);

WriteMakefile(%INFO);