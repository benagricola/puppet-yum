# = Class: yum::defaults
#
# This class manages default yum repositories for RedHat based distros:
# RHEL, Centos, Scientific Linux
#
class yum::defaults ( ) inherits yum::params {

  if $yum::extrarepo =~ /epel/ { include yum::repo::epel }
  if $yum::extrarepo =~ /rpmforge/ { include yum::repo::rpmforge }
  if $yum::extrarepo =~ /jpackage5/ { include yum::repo::jpackage5 }
  if $yum::extrarepo =~ /jpackage6/ { include yum::repo::jpackage6 }
  if $yum::extrarepo =~ /remi/ { include yum::repo::remi }
  if $yum::extrarepo =~ /tmz/ and $::operatingsystemmajrelease != "4" { include yum::repo::tmz }
  if $yum::extrarepo =~ /webtatic/ { include yum::repo::webtatic }
  if $yum::extrarepo =~ /puppetlabs/ and $::operatingsystemmajrelease != "4" { include yum::repo::puppetlabs }
  if $yum::extrarepo =~ /puppetdevel/ and $::operatingsystemmajrelease != "4" { include yum::repo::puppetdevel }
  if $yum::extrarepo =~ /nginx/ and $::operatingsystemmajrelease != "4" { include yum::repo::nginx }
  if $yum::extrarepo =~ /mongodb/ and $::operatingsystemmajrelease != "4" { include yum::repo::mongodb }
  if $yum::extrarepo =~ /repoforge/ { include yum::repo::repoforge }
  if $yum::extrarepo =~ /repoforgeextras/ { include yum::repo::repoforgeextras }
  if $yum::extrarepo =~ /squizuk/ { include yum::repo::squizuk }

  if $yum::bool_defaultrepo {
    case $operatingsystem {
      centos: {
        if $::operatingsystemmajrelease == "6" { include yum::repo::centos6 }
        if $::operatingsystemmajrelease == "5" { include yum::repo::centos5 }
        if $::operatingsystemmajrelease == "4" { include yum::repo::centos4 }
        if $yum::extrarepo =~ /centos-testing/ { include yum::repo::centos_testing }
        if $yum::extrarepo =~ /karan/ { include yum::repo::karan }
        if $yum::extrarepo =~ /atomic/ { include yum::repo::atomic }
      }
      redhat: {
      }
      scientific: {
        include yum::repo::sl
        if $yum::extrarepo =~ /centos-testing/ { include yum::repo::centos_testing }
        if $yum::extrarepo =~ /karan/ { include yum::repo::karan }
      }
      default: { }
    }
  }
}
