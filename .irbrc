require "irb/completion"
require "irb/ext/save-history"
require "pp"

IRB.conf[:SAVE_HISTORY] = 200

#Set up Looksee
begin
  require 'looksee'
  Looksee.styles[:module]	= "\e[1;30m%s\e[0m"
  Looksee.styles[:public]	= "\e[0;34m%s\e[0m"
  Looksee.styles[:protected]	= "\e[0;35m%s\e[0m"
  Looksee.styles[:private]	= "\e[0;31m%s\e[0m"
  Looksee.styles[:undefined]	= "\e[0;33m%s\e[0m"
  Looksee.styles[:overridden]	= "\e[1;34m%s\e[0m"
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

# Load an .irbrc in the local directory, if there is one
local_irbrc = Dir.pwd + "/.irbrc"
if File.exists?( local_irbrc ) and local_irbrc != __FILE__
  begin
    load ".irbrc"
  rescue LoadError => err
    puts "Couldn't load local .irbrc"
  end
end
