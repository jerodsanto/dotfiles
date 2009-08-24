def symlink(source, target)
  puts "Linking #{target} => #{source}"
  if File.exist?(target)
    puts "  * deleting existing file #{target}"
    File.unlink(target)
  end
  File.symlink(source, target)
  puts
end

desc "Install all dotfiles"
task :install do
  home = ENV['HOME']
  pwd  = File.dirname(__FILE__)
 
  %w(bashrc gemrc gitconfig irbrc screenrc vimrc vim).each do |file|
    symlink("#{pwd}/#{file}", "#{home}/.#{file}")
  end
end