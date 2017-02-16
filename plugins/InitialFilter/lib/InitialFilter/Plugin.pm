package InitialFilter::Plugin;

use strict;
use warnings;

sub plugin {
    return MT->component('InitialFilter');
}

#----- Hook
sub hdlr_pre_run {
    my $app  = MT->instance;
    my $blog = $app->blog;
    return unless $blog && $blog->id;

    my $blog_id = $blog->id;
    my $scope   = 'blog:' . $blog_id;
    my $type    = $app->param('_type');
    my $mode    = $app->param('__mode');
    return unless $type && $mode eq 'list';

    my $plugin = plugin();
    my $setting = $plugin->get_config_value( 'filter_key', $scope );
    return unless $setting;

    # Transform from setting value text into hash
    require YAML::Tiny;
    my $yaml_tiny = YAML::Tiny->new;
    $yaml_tiny = YAML::Tiny->read_string($setting) || YAML::Tiny->errstr;
    my $yaml = $yaml_tiny->[0];
    return unless $yaml->{$type} && ref( $yaml->{$type} ) eq 'HASH';

    # Get setting for the current listing table
    my $id = $yaml->{$type}{id};
    return unless $id;

    my $force = $yaml->{$type}{force} || 0;

    # Set filter_key
    my $list_prefs = $app->user->list_prefs         || {};
    my $list_pref  = $list_prefs->{$type}{$blog_id} || {};
    if ($force) {
        $app->param( 'filter_key', $id );
    }
    elsif ( !$list_pref->{last_filter} && !$app->param('filter_key') ) {
        $app->param( 'filter_key', $id );
    }
}

1;
