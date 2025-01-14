#!/bin/bash
echo -n "Enter your favourite pet: "
read pet
case $pet in
"dog")
	echo "  Ahh! Dog is too loyal home animal ..Good "
	;;
"cat" | "Kitty" | "Pussy")
	echo "  Cat or Kitty or Pussy are good for people who often stress "
	;;
fish | "bird")
	echo "fish only for eating XaXa xoxo"
	;;
*)
	echo "Your type is stood unknown ! Sorry."
esac
