FROM debian:jessie-slim



#### packages ####

RUN apt-get update && apt-get --assume-yes upgrade
RUN apt-get --assume-yes install \
	curl \
	ctags \
	git \
	screen \
	vim-gnome \
	zsh



##### zsh #####

RUN chsh -s /bin/zsh
ENV SHELL /bin/zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh
ADD https://raw.githubusercontent.com/hackenfreude/dotfiles/master/zshrc /root/.zshrc
RUN chmod 0664 /root/.zshrc



##### screen #####

ADD https://raw.githubusercontent.com/hackenfreude/dotfiles/master/screenrc /root/.screenrc
RUN chmod 0664 /root/.screenrc



##### git #####
ADD https://raw.githubusercontent.com/hackenfreude/dotfiles/master/gitconfig /root/.gitconfig
RUN chmod 0664 /root/.gitconfig



##### vim #####

ADD https://raw.githubusercontent.com/hackenfreude/dotfiles/master/vimrc /root/.vimrc
RUN chmod 0664 /root/.vimrc
ADD https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim /root/.vim/autoload/plug.vim
RUN chmod 0664 /root/.vim/autoload/plug.vim
RUN vim -c "PlugInstall" -c "qa"




CMD ["/bin/zsh"]
