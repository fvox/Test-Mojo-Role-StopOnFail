package Test::Mojo::Role::StopOnFail;
use Mojo::Base -role;
use Test::More;

# ABSTRACT: Stop Mojolicious tests after first failure.

my @methods = qw(
    content_is
    content_isnt
    content_like
    content_type_is
    content_type_isnt
    content_type_like
    content_type_unlike
    content_unlike
    delete_ok
    element_count_is
    element_exists
    element_exists_not
    finish_ok
    finished_ok
    get_ok
    head_ok
    header_is
    header_isnt
    header_like
    header_unlike
    json_has
    json_hasnt
    json_is
    json_like
    json_message_has
    json_message_hasnt
    json_message_is
    json_message_like
    json_message_unlike
    json_unlike
    message_is
    message_isnt
    message_like
    message_ok
    message_unlike
    options_ok
    patch_ok
    post_ok
    put_ok
    request_ok
    send_ok
    status_is
    status_isnt
    text_is
    text_isnt
    text_like
    text_unlike
    websocket_ok
);

around @methods => sub {
    my $orig = shift;

    my $t = $orig->(@_);
    $t->success or BAIL_OUT("Test::Mojo failed");
    return $t;
};

1;
