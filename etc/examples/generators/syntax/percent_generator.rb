#!/usr/bin/env ruby

arg = ARGV.pop


# Usage example:
#
#   ./etc/examples/generators/syntax/percent_generator.rb %Q > etc/examples/syntax/percent/Q.rb
#
# read this file with foldlevel 0 to see options beside of `%Q`

puts "# Generated by `" <<
     "./etc/examples/generators/syntax/percent_generator.rb %Q" <<
     " > etc/examples/syntax/percent/Q.rb" <<
     "`\n\n"



# %Q {{{
# Generalized Double Quoted String and Array of Strings and Shell Command Output
if arg == '%Q'
  # Note: %= is not matched here as the beginning of a double quoted string
  %Q[~`!@\#$%^&*_-+|:;"',.?/].split(//).each do |s|
    puts <<-END.gsub(/^\s{4}/, '')
      %#{s}
        foo
        \\#{s}
        \\\\\\#{s}
        bar
      #{s}


    END
  end

  %w(Q W x).each do |leading|
    %Q[~`!@\#$%^&*_-+=|:;"',.?/].split(//).each do |s|
      puts <<-END.gsub(/^\s{6}/, '')
        %#{leading}#{s}
          foo
          \\#{s}
          \\\\\\#{s}
          bar
        #{s}


      END
    end

    %w({} <> [] ()).each do |pair|
      puts <<-END.gsub(/^\s{6}/, '')
        %#{leading}#{pair[0]}
          foo
          \\#{pair[1]}
          \\\\\\#{pair[1]}
          bar
        #{pair[1]}


      END
    end

    puts "  %#{leading} foo\\ \\\\\\ bar \n\n" unless leading == 'W'
  end
end
# }}}



puts "#\svim:foldmethod=syntax"


# vim:foldmethod=marker
