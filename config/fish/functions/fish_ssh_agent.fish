# function fish_ssh_agent --description 'launch the ssh-agent and add the id_rsa identity'
#     if begin
#             set -q SSH_AGENT_PID
#             and kill -0 $SSH_AGENT_PID
#             and grep -q '^ssh-agent' /proc/$SSH_AGENT_PID/cmdline
#     end
#         echo "ssh-agent running on pid $SSH_AGENT_PID"
#     else
#         eval (command ssh-agent -c  | sed 's/^setenv/set -Ux/')
#     end
#     set -l identity $HOME/.ssh/ssh-key-git-jgag
#     set -l fingerprint (ssh-keygen -lf $identity | awk '{print $2}')
#     ssh-add -l | grep -q $fingerprint
#         or ssh-add $identity
# end

# function fish_ssh_agent --description 'launch the ssh-agent and add the id_rsa identity'
#     if begin
#         set -q SSH_AGENT_PID
#         and kill -0 $SSH_AGENT_PID
#         and ps -p $SSH_AGENT_PID | grep -q 'ssh-agent'
#     end
#         echo "ssh-agent running on pid $SSH_AGENT_PID"
#     else
#         set -l ssh_agent_info (ssh-agent -c)
#         eval $ssh_agent_info
#     end
#     set -l identity $HOME/.ssh/ssh-key-git-jgag
#     set -l fingerprint (ssh-keygen -lf $identity | awk '{print $2}')
#     ssh-add -l | grep -q $fingerprint
#         or ssh-add $identity
# end
