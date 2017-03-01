confirm_install() {
	
	read -p "Install $1? [y/n]: " $ans
	if [[ -z $ans || $ans == "y" || $ans == "Y" ]]; then
		echo $1
		# sudo apt-get install $1
	elif [[ $ans != "N" && $ans != "n" ]]; then
		echo error input
		exit 35
	fi
}
shopt -s dotglob
cd $HOME/dotfiles
DOT="$HOME/dotfiles"
echo "change to $DOT"
for f in *
do 
	if [[ -f $f && $f =~ ^\.+ ]]; then
		confirm "link" $f
		# if [[ -e $HOME/$f ]];then
			# rm $HOME/$f
		# fi
		# ln -s $DOT/$f $HOME/$f
	fi
done
