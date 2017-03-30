if ! [ -f ~/.ssh/id_rsa ]; then
	ssh-keygen -t rsa -b 4096 -C "frankfang1990@gmail.com"
	ssh-add ~/.ssh/id_rsa
	pbcopy < ~/.ssh/id_rsa.pub
	cat ~/.ssh/id_rsa.pub
else
	cat ~/.ssh/id_rsa.pub
fi
