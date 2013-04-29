class yum::prerequisites {

  require yum

  yum::plugin { 'priorities': }
  yum::plugin { 'security': }

  file { 'rpm_gpg':
    path   => '/etc/pki/rpm-gpg/',
    source => "puppet:///modules/yum/${operatingsystem}.${::operatingsystemmajrelease}/rpm-gpg/",
    recurse => true,
#    purge   => $yum::bool_clean_repos ? {
#      true  => true,
#      false => false,
#    },
    ignore  => '.svn',
    mode    => 0600,
    owner   => root,
    group   => 0,
  }

  # Order yumrepos before installing packages
  Yumrepo <| |> -> Package <| |>
}
