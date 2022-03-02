function fish_greeting
	if test (tput cols) -ge 80; and test (tput lines) -ge 10
		quote.fish
	end

    # printf "Available upgrades: %d" (pacman -Qu | wc -l)
end
