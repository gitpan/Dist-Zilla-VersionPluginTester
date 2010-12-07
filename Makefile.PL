
use strict;
use warnings;

BEGIN { require v5.10; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => '[1-line description of module]',
  'AUTHOR' => 'Ryan C. Thompson <rct@thompsonclan.org>',
  'BUILD_REQUIRES' => {
    'Carp' => '0',
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Scalar::Util' => '0',
    'Test::More' => '0.94'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Dist-Zilla-VersionPluginTester',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Dist::Zilla::VersionPluginTester',
  'PREREQ_PM' => {
    'utf8' => '0'
  },
  'VERSION' => '1.103410',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



