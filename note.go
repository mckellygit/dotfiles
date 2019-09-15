cd go
rm -rf src pkg bin
cd ~
go get -d github.com/rgburke/grv/cmd/grv
cd go/src/github.com/rgburke/grv
make install

cd ~
go get github.com/jesseduffield/lazygit

# are these needed ?
sudo apt-get install libhttp-parser-dev
sudo apt-get install libssh2-1-dev

cd ~
go get -u github.com/jingweno/ccat

cd ~
go get -u github.com/walles/moar

# this needs highlight -
sudo apt-get install highlight

