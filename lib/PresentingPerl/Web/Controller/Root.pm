package PresentingPerl::Web::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

PresentingPerl::Web::Controller::Root - Root Controller for PresentingPerl::Web

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 all

=cut

sub auto :Private {
  my ($self, $c) = @_;

  $c->stash->{wrapper_template} = $c->path_to('root/pp-tempates/html/layout.html');
}

=head2 index

The root page (/)

=cut

sub front_page : Path :Args(0) {
    my ($self, $c) = @_;

    $c->stash->{current_view} = 'Zoom';
    $c->stash->{announcements} = $c->model("DB::Announcement")->top_n(5);
}

sub bucket: Path: Args(1) {
    my ($self, $c, $bucket) = @_;

    my $bucketrow = $c->model('DB::Bucket')->find({ slug => $bucket });

    return $c->forward('default') if(!$bucketrow);

    $c->stash->{current_view} = 'Zoom';
    $c->stash->{bucket} = $bucketrow;
}

# sub index :Path :Args(0) {
#     my ( $self, $c ) = @_;

#     # Hello World
#     $c->response->body( $c->welcome_message );
# }

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Catalyst developer

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
