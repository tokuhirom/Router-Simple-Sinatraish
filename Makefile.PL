use inc::Module::Install;
name 'Router-Simple-Sinatraish';
all_from 'lib/Router/Simple/Sinatraish.pm';

requires 'Router::Simple' => 0.06;
requires 'parent';

readme_markdown_from 'lib/Router/Simple/Sinatraish.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
author_tests('xt');
auto_include;
WriteAll;
