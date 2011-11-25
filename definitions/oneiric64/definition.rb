require File.dirname(__FILE__) + "/../.common/definition.rb"

options = {
  :os_type_id => "Ubuntu_64",
  :iso_file => "ubuntu-11.10-server-amd64.iso",
  :iso_src => "http://releases.ubuntu.com/11.10/ubuntu-11.10-server-amd64.iso",
  :iso_md5 => "f8a0112b7cb5dcd6d564dbe59f18c35f"
}

Veewee::Session.declare(SESSION.merge(options))
