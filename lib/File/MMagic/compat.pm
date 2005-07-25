# $Id$
#
# Copyright (c) 2005 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package File::MMagic::XS;
use strict;

*checktype_filename   = \&get_mime;
*checktype_filehandle = \&fhmagic;
*checktype_contents   = \&bufmagic;
*addMagicEntry        = \&add_magic;

1;
