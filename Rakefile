require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*[^~]'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
  
  # add the source line to .bashrc if missing :
  bash_profile_found = false
  parse_bashrc do |line|
    break if bash_profile_found = ( line =~ /\/\.bash_profile/ )
  end
  
  source_bash_profile = "source ~/.bash_profile"

  unless bash_profile_found
    print "modify ~/.bashrc? [ynaq] "
    content = "\n\n# added by dotfiles `rake install` : \n" + source_bash_profile + "\n"
    if replace_all
      append_bashrc content
    else
      case $stdin.gets.chomp
      when 'y', 'a'
        puts "appending ~/.bashrc"
        append_bashrc content
      when 'q'
        exit
      else
        puts "skipping ~/.bashrc update"
        puts "add the following line to .bashrc :"
        puts "\n" + source_bash_profile + "\n"
      end
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def parse_bashrc
  bashrc = File.join(ENV['HOME'], ".bashrc")
  File.open(bashrc) do |file|
    file.each_line { |line| yield(line) }
  end
end

def append_bashrc(content)
  bashrc = File.join(ENV['HOME'], ".bashrc")
  File.open(bashrc, 'a') do |file|
    file << content
  end
end
