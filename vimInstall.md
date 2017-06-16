[Build VIm from source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)

1. First install some dependencies

2. Clone vim
> git clone https://github.com/vim/vim.git

3. Under the vim repo, run `./configure --help` to view more options. 

Sample config on my Debian box:
```./configure --with-features=huge \
			--enable-multibyte \
			--enable-python3interp=yes \
			--with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu \
			--enable-perlinterp=yes \
			--enable-cscope \
			--with-compiledby="qiwang" \
			--with-x \
			--enable-fontset \
			--enable-gui=auto \
			--enable-fail-if-missing
```

4. Use checkinstall to manage installation easily.
> sudo checkinstall

> dpkg -r vim
