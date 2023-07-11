function remind_sound
    set COUNT (count $argv)
    set COMMAND $argv[1]
    set MESSAGE $argv[1]
    set OP $argv[2]
    set WHEN $argv[3..-1]

    # display help if no parameters or help command
    if test $COUNT -eq 0 -o $COMMAND = "help" -o $COMMAND = "--help" -o $COMMAND = "-h"
        echo "COMMAND"
        echo "    remind_sound <message> <time>"
        echo "    remind_sound <command>"
        echo
        echo "DESCRIPTION"
        echo "    Displays notification and plays a sound at specified time"
        echo
        echo "EXAMPLES"
        echo '    remind_sound "Hi there" now'
        echo '    remind_sound "Time to wake up" in 5 minutes'
        echo '    remind_sound "Dinner" in 1 hour'
        echo '    remind_sound "Take a break" at noon'
        echo '    remind_sound "Are you ready?" at 13:00'
        echo '    remind_sound list'
        echo '    remind_sound clear'
        echo '    remind_sound help'
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
            echo "remind_sound: unknown command $COMMAND. Type 'remind_sound' without any parameters to see syntax."
        end
        return
    end

    # determine time of notification
    if test $OP = "in"
        set TIME "now + $WHEN"
    else if test $OP = "at"
        set TIME "$WHEN"
    else
        echo "remind_sound: invalid time operator $OP"
        return
    end

    # create temporary script
    set SCRIPT (mktemp)
    echo "#!/bin/sh" > $SCRIPT
    echo "sleep 0; notify-send '$MESSAGE' 'Reminder' -u critical" >> $SCRIPT
    echo "play ~/Downloads/aughhhhh-aughhhhh.mp3" >> $SCRIPT  # Substitua "/path/to/sound/file.wav" pelo caminho do arquivo de som desejado
    chmod +x $SCRIPT

    # schedule the script execution with at
    echo "$SCRIPT" | at $TIME 2>/dev/null
    echo "Notification and sound scheduled at $TIME"
end
