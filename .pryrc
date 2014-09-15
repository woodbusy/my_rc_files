require "pp"

Pry.config.theme = "solarized"

#Set up Looksee
begin
  require 'looksee'
  Looksee.styles[:module] = "\e[1;30m%s\e[0m"
  Looksee.styles[:public] = "\e[0;34m%s\e[0m"
  Looksee.styles[:protected]  = "\e[0;35m%s\e[0m"
  Looksee.styles[:private]  = "\e[0;31m%s\e[0m"
  Looksee.styles[:undefined]  = "\e[0;33m%s\e[0m"
  Looksee.styles[:overridden] = "\e[1;34m%s\e[0m"
rescue LoadError
  puts "Couldn't load 'looksee'"
end

#Set up Sketches
begin
  require "sketches"
  Sketches.config( :editor => 'subl' )
rescue LoadError
  puts "Couldn't load 'sketches'"
end

# Load an .irbrc/.pryrc in the local directory, if there is one
[".irbrc",".pryrc"].each do |rc_filename|
  local_rc = Dir.pwd + "/" + rc_filename
  if File.exists?( local_rc ) and local_rc != __FILE__
    begin
      load rc_filename
    rescue LoadError => err
      puts "Couldn't load local #{rc_filename}"
    end
  end
end
