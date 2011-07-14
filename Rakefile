require "fileutils"

files = Dir["*[^README|Rakefile]"]
home  = ENV["HOME"]

def say(msg)
  puts " * #{msg}"
end

task :default => [:install]

desc "Install all dotfiles"
task :install => [:uninstall] do
  files.each do |file|
    source = File.expand_path(file)
    target = "#{home}/.#{file}"
    say "installing #{source} to #{target}"
    File.symlink source, target
  end
  say "installing vim plugins"
  system "vim -u #{home}/.vim/bundles.vim +BundleInstall +q"
end

desc "Uninstall all dotfiles"
task :uninstall do
  files.each do |file|
    target = "#{home}/.#{file}"
    say "deleting #{target}"
    FileUtils.rm_f target
  end
end
