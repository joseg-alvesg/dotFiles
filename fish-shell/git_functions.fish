function ga
        git add $argv
end

function gaa
        git add --all
end

function gcaula
        git add --all && git commit -m $argv 
end

function gcmsg
        git commit -m $argv
end

function gp
        git push
end

function gl
        git pull
end
