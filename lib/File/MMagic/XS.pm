# $Id: XS.pm 8 2005-06-23 09:10:08Z daisuke $
#
# Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package File::MMagic::XS;
use 5.006001;
use strict;
our $VERSION = '0.03';
our $MAGIC_FILE = undef;

require XSLoader;
XSLoader::load('File::MMagic::XS', $VERSION);

if (! defined $MAGIC_FILE) {
    require File::Spec;
    foreach my $path (map { File::Spec->catfile($_, qw(File MMagic magic)) } @INC) {
        if (-f $path) {
            $MAGIC_FILE = $path;
            last;
        }
    }
}

sub new
{
    my $class = shift;
    my $self  = bless {}, $class;
    $self->_alloc_fmmstate;

    my %args = @_;

    if (! $args{file}) {
        if (!$MAGIC_FILE) {
            die "No magic file found :(";
        }
        $args{file} ||= $MAGIC_FILE;
    }

    $self->parse_magic_file($args{file});
    return $self;
}

1;

__END__

=head1 NAME

File::MMagic::XS - Guess File Type With XS (a la mod_mime_magic)

=head1 SYNOPSIS

  use File::MMagic::XS;

  my $m = File::MMagic::XS->new();
  my $mime = $m->get_mime($file);

=head1 DESCRIPTION

This is a port of Apache2 mod_mime_magic.c in Perl, written in XS with the
aim of being efficient and fast especially for applications that need to be 
run for an extended amount of time.

Currently this software is in beta. If you have suggestions/recommendations 
about the interface or anything else, now is your chance to send them!

=head1 METHODS

=head2 new(%args)

Creates a new File::MMagic::XS object.

If you specify the C<file> argument, then File::MMagic::XS will load magic
definitions from the specified file. If unspecified, it will use the magic
file that will be installed under File/MMagic/ directory.

=head2 parse_magic_file($file)

Read and parse a magic file, as used by Apache2.

=head2 get_mime($file)

Inspects the file specified by C<$file> and returns a MIME type if possible.
If no matching MIME type is found, then undef is returned.

=head2 fsmagic($file)

Inspects a file and returns a MIME type using inode information only. The
contents of the file is not inspected.

=head2 ascmagic($file)

Inspects a piece of data (assuming it's not binary data), and attempts to
determine the file type.

=head2 error()

Returns the last error string.

=head1 PERFORMANCE

          Rate   perl     xs
  perl  89.1/s     --  -100%
  xs   24390/s 27283%     --

Hey, I told you it's fast...

=head1 TODO

Add File::MMagic interface compatibility?

Use PerlIO_* abstraction?

=head1 SEE ALSO

L<File::MMagic|File::MMagic>

=head1 AUTHOR

Copyright 2005 Daisuke Maki E<lt>dmaki@cpan.orgE<gt>. Development funded by Brazil Ltd E<lt>http://b.razil.jpE<gt>. 

Underlying software: Copyright 1999-2004 The Apache Software Foundation, Copyright (c) 1996-1997 Cisco Systems, Inc., Copyright (c) Ian F. Darwin, 1987. Written by Ian F. Darwin.

=cut
