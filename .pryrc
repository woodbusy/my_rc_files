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
unless Dir.home == Dir.pwd
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
end

module PryRC
  module StringHelpers
    HEXCHARS = [("0".."9").to_a, ("a".."f").to_a].flatten

    #From the Ruby Black Bag (http://github.com/emonti/rbkb/)
    # Convert a string to ASCII hex string. Supports a few options for format:
    # :delim - delimter between each hex byte
    # :prefix - prefix before each hex byte
    # :suffix - suffix after each hex byte
    def hexify(opts={})
      delim = opts[:delim]
      pre = (opts[:prefix] || "")
      suf = (opts[:suffix] || "")

      if (rx=opts[:rx]) and not rx.kind_of? Regexp
        raise "rx must be a regular expression for a character class"
      end

      out=Array.new

      self.each_byte do |c|
        hc = if (rx and not rx.match c.chr)
          c.chr
        else
          pre + (HEXCHARS[(c >> 4)] + HEXCHARS[(c & 0xf )]) + suf
        end
        out << (hc)
      end
      out.join(delim)
    end

    # Convert ASCII hex string to raw.
    # Parameters:
    #   d = optional 'delimiter' between hex bytes (zero+ spaces by default)
    def unhexify(d=/\s*/)
      self.strip.gsub(/([A-Fa-f0-9]{1,2})#{d}?/) { $1.hex.chr }
    end
  end
end

class String
  include PryRC::StringHelpers
end
