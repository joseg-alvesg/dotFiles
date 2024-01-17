function sch --description 'set redshift and brightness'
  if test -n "$argv[1]" -a -n "$argv[2]"
    redshift -x
    redshift -m randr -O $argv[1] -b $argv[2]
    return 0
  else if test -n "$argv[1]" -a "$argv[1]" = "off"
    redshift -x
    return 0
  else if test -n "$argv[1]"
    redshift -x
    redshift -m randr -O "$argv[1]"
    return 0
  else
    redshift -x
    redshift -m randr -O 3800 -b 0.9
    echo "Usage: sch [TEMPERATURE] [BRIGHTNESS]"
  end
end
