
default[:i3wm][:source_url] = "http://i3wm.org/downloads/i3-4.1.1.tar.bz2"
default[:i3wm][:apt][:debian] = {
  'uri' => "http://build.i3wm.org/debian/sid", #  sid main,
  'distribution' => 'sid',
  'components' => ['main']
}
default[:i3wm][:apt][:ubuntu] = {
  'uri' => "http://build.i3wm.org/ubuntu/oneiric",  # oneiric main
  'distribution' => 'oneiric',
  'components' => ['main']
}
