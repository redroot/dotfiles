all: aliases git brew brew-bundle ruby

aliases:
	cp bash/aliases ~/.bash_aliases

git:
	cp git/gitconfig ~/.gitconfig

brew:
	command -v brew || /bin/bash -c '/usr/bin/ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"'

brew-bundle: brew
	@brew tap Homebrew/bundle || echo ''
	brew bundle

ruby: brew-bundle
	[ -d ~/.rbenv/versions/$(LATEST_RUBY) ] || rbenv install $(LATEST_RUBY)
	rbenv global $(LATEST_RUBY)
