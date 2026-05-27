# LazyGit (vía Go)

Requiere Go porque se instala con `go install`.

## 1. Instalar Go (si no está)
cd /tmp
wget https://go.dev/dl/go1.26.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.26.0.linux-amd64.tar.gz

## 2. Agregar Go al PATH (~/.bashrc)
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

## 3. Verificar
go version

## 4. Instalar LazyGit
go install github.com/jesseduffield/lazygit@latest

## 5. Verificar
lazygit --version
