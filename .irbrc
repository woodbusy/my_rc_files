require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 200

#Set up Looksee
begin
  require 'looksee'
  Looksee.styles[:overridden] = "\e[1;35m%s\e[0m"
rescue LoadError
  puts "Couldn't load 'looksee'"
end

begin
  require 'sketches'
  Sketches.config :editor => 'mvim'#, :eval_after_editor_quit => true, :background => false
rescue LoadError
  puts "Couldn't load 'sketches'"
end

