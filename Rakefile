require 'fileutils'
FILES = %w(bashrc bash_aliases gemrc gitconfig irbrc screenrc vimrc vim)
HOME  = ENV["HOME"]
PWD   = File.dirname(__FILE__)

def symlink(source, target)
  puts "Linking #{target} => #{source}"
  if File.exist? target
    puts "  * deleting existing file #{target}"
    FileUtils.rm_rf target
  end
  File.symlink source, target
end

desc "Install all dotfiles"
task :install do
  FILES.each do |file|
    symlink "#{PWD}/#{file}", "#{HOME}/.#{file}"
  end
end

desc "Uninstall all dotfiles"
task :uninstall do
  FILES.each do |file|
    puts "Deleting #{HOME}/.#{file}"
    FileUtils.rm_f "#{HOME}/.#{file}"
  end
end
