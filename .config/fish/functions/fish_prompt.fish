function fish_prompt
	set -l __last_command_exit_status $status
    if not set -q -g __fish_robbyrussell_functions_defined
      set -g __fish_robbyrussell_functions_defined
    end

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l arrow "$red\$"
    set -l cwd $green(basename (prompt_pwd))

    echo -n -s $arrow' '$cwd $normal ' '
end
