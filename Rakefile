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
  mkdir_p DIR + 'cookbooks'
  chdir('cookbooks') do
    sh "echo '*' >> .gitignore" unless File.exists?('.gitignore')
    %w[ apt chef ].each do |ckbk|
      unless File.directory?(ckbk)
        sh "git clone git@github.com:dysinger/cookbook-#{ckbk}.git #{ckbk}"
      end
    end
  end
end
