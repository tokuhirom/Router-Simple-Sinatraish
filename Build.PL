use strict;
use warnings FATAL => 'all';
use Module::Build;

my $build = Module::Build->new(
    license              => 'perl',
    recursive_test_files => 1,
    dynamic_config       => 0,
    build_requires       => { 'Test::More' => '0.98' },
    configure_requires   => { 'Module::Build' => '0.38' },
    requires             => {
        'perl'           => '5.00800',
        'parent'         => '0',
        'Router::Simple' => '0.09'
    },
    no_index    => { 'directory' => [ 'inc', 't', 'xt' ] },
    name        => 'Router-Simple-Sinatraish',
    module_name => 'Router::Simple::Sinatraish',

    test_files => ( -d '.git' || $ENV{RELEASE_TESTING} ) ? 't/ xt/' : 't/',

    create_readme  => 1,
    create_license => 1,
    meta_merge => {
        resources => {
            repository => 'https://github.com/tokuhirom/Router-Simple-Sinatraish'
        }
    },
);
$build->create_build_script();
