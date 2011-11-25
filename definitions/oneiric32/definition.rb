require File.dirname(__FILE__) + "/../.common/definition.rb"

options = {
  :os_type_id => "Ubuntu",
  :iso_file => "ubuntu-11.10-server-i386.iso",
  :iso_src => "http://releases.ubuntu.com/11.10/ubuntu-11.10-server-i386.iso",
  :iso_md5 => "881d188cb1ca5fb18e3d9132275dceda"
}

Veewee::Session.declare(SESSION.merge(options))
