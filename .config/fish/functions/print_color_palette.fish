function print_color_palette
    for i in (seq 0 255)
        printf "\033[38;5;$i"m"colour$i\033[0m\n"
    end
end
