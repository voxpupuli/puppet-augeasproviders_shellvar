#
define augeasproviders_shellvar::bulk (
  $target,
  $quoted = undef,
) {

    $arr = split($name, '=')
    $k = $arr[0]
    $v = $arr[1]

    shellvar { "${target} ${k}":
      ensure   => present,
      variable => $k,
      value    => $v,
      target   => $target,
      quoted   => $quoted,
    }


}
