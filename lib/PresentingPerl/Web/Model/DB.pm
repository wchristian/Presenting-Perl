package PresentingPerl::Web::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'PresentingPerl::Schema',
    
    connect_info => {
        dsn => 'dbi:SQLite:idiotbox.db',
        user => '',
        password => '',
    }
);

=head1 NAME

PresentingPerl::Web::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<PresentingPerl::Web>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<PresentingPerl::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.59

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
