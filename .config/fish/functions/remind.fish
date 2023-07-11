function remind
    set COUNT (count $argv)
    set COMMAND $argv[1]
    set MESSAGE $argv[1]
    set OP $argv[2]
    set WHEN $argv[3..-1]

    # display help if no parameters or help command
    if test $COUNT -eq 0 -o $COMMAND = "help" -o $COMMAND = "--help" -o $COMMAND = "-h"
        echo "COMMAND"
        echo "    remind <message> <time>"
        echo "    remind <command>"
        echo
        echo "DESCRIPTION"
        echo "    Displays notification at specified time"
        echo
        echo "EXAMPLES"
        echo '    remind "Hi there" now'
        echo '    remind "Time to wake up" in 5 minutes'
        echo '    remind "Dinner" in 1 hour'
        echo '    remind "Take a break" at noon'
        echo '    remind "Are you ready?" at 13:00'
        echo '    remind list'
        echo '    remind clear'
        echo '    remind help'
        echo
        return
    end

    # run commands: list, clear
    if test $COUNT -eq 1
        if test $COMMAND = "list"
            at -l
        else if test $COMMAND = "clear"
            at -r (atq | cut -f1)
        else
            echo "remind: unknown command $COMMAND. Type 'remind' without any parameters to see syntax."
        end
        return
    end

    # determine time of notification
    if test $OP = "in"
        set TIME "now + $WHEN"
    else if test $OP = "at"
        set TIME "$WHEN"
    else
        echo "remind: invalid time operator $OP"
        return
    end

    # create temporary script
    set SCRIPT (mktemp)
    echo "#!/bin/sh" > $SCRIPT
    echo "sleep 0; notify-send '$MESSAGE' 'Reminder' -u critical" >> $SCRIPT
    chmod +x $SCRIPT

    # schedule the script execution with at
    echo "$SCRIPT" | at $TIME 2>/dev/null
    echo "Notification scheduled at $TIME"
end
