#-*- mode: ruby; -*-

DIR = File.dirname(__FILE__)

namespace :box do
  [ :lucid, :maverick, :natty ].each do |release|
    [ 32, 64 ].each do |architecture|
      flavor = "#{release}#{architecture}"
      ( @flavors ||= [] ) << flavor
      desc "Build #{flavor}"
      task flavor do
        begin sh "rm -f #{flavor}.box" ; rescue ; end
        [ :build, :export, :destroy ].each do |command|
          sh "bundle exec vagrant basebox #{command} #{flavor}"
        end
        begin sh "bundle exec vagrant box remove #{flavor}" ; rescue ; end
        sh "bundle exec vagrant box add #{flavor} #{flavor}.box"
      end
    end
  end

  desc "Build all"
  task :all => @flavors
end

desc "Download Cookbooks"
task :cookbooks do
  `mkdir -p #{DIR}/cookbooks`
  `echo '*' >> #{DIR}/cookbooks/.gitignore`
  `[ ! -d cookbooks/apt ] && \
git clone git@github.com:dysinger/cookbook-apt.git \
#{DIR}/cookbooks/apt`
  `[ ! -d cookbooks/chef ] && \
git clone git@github.com:dysinger/cookbook-chef.git \
#{DIR}/cookbooks/chef`
end
