# = Class: yum::repo::squizuk
#
# This class installs the Squiz UK repo
#
class yum::repo::squizuk  {
  yum::managed_yumrepo { 'squizuk':
    descr         => 'Squiz UK Packages - $basearch',
    baseurl       => 'https://packages.squiz.co.uk/scientific/$releasever/$basearch',
    enabled       => 1,
    gpgcheck      => 1,
    gpgkey        => 'http://packages.squiz.co.uk/RPM-GPG-KEY',
    autokeyimport => 'yes',
    priority      => 10
  }

  yum::managed_yumrepo { 'squizuk-noarch':
    descr         => 'Squiz UK Packages - $basearch (noarch)',
    baseurl       => 'https://packages.squiz.co.uk/scientific/$releasever/noarch',
    enabled       => 1,
    gpgcheck      => 1,
    priority      => 10
  }

}