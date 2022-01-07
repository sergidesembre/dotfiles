# Dotfile git configuration

## Resume
* [First step](#first-step)
* [Git aliases](#git-aliases)
* [Global git ignore](#global-git-ignore)
* [Custom git commit message](#custom-git-commit-message)
* [Git configuration for multiple profiles (GitHub, GitLab, Bitbucket, ...)](#git-configuration-for-multiple-profiles)
* [SSH file definition by hostname](#ssh-file-definition-by-hostname)
* [How to use GPG](#how-to-use-gpg)
* [Run script](#run-script)

## First step
Before to start git configuration ensure you are installed git and set my custom configuration `gitconfig`:
```
sudo apt install git
ln -sf ~/.dotfiles/git/gitconfig ~/.config/git/gitconfig
```

## Git aliases
For git I usually use the aliases from [plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) of oh-my-zsh. 
This plugin are installed by default, to enable only need to add the `git` plugin into my `.zshrc` file:
```
plugins=(git ...)
```

If I need to define another custom aliases I can update `gitconfig.aliases` file to write my alias.
For do this it's necessary create link:
```
ln -sf $HOME/.dotfiles/git/gitconfig.aliases $HOME/.config/git/gitconfig.aliases
```

## Global git ignore
In `gitconfig.ignore` file I can define files or folder to ignore when does commit.
To use the global git ignore we need to create link:
```
ln -sf $HOME/.dotfiles/git/gitconfig.ignore $HOME/.config/git/gitconfig.ignore
```

## Custom git commit message
I have a custom git message when commit files where are define the title, description, type of issue or ticket number if it's necessary.
If I like to use this we need to crete link:
```
ln -sf $HOME/.dotfiles/git/gitconfig.message $HOME/.config/git/gitconfig.message
```
When I write the commit message I like to set the title or type of issue correctly, so I created some rules in `gitcommit.nanorc` (only 
for nano editor) to hightlight with colors if it's wrong or ok the message.
To add this configuration in own nano editor needs to do the next steps (ensure you exist folders):
```
mkdir $HOME/.config/nano
ln -sf $HOME/.dotfiles/git/editor/nano/gitmessage.nanorc $HOME/.config/nano/gitmessage
echo "include $HOME/.config/nano/gitmessage" >> $HOME/.nanorc
```

## Git configuration for multiple profiles
Ok! In my case I will like to use different git accounts depends the project (personal or company), fot this reason I set configured 
my `gitconfig` file to use different profiles by folder:
* `~/Code/me` (personal projects) -> `gitconfig.github.profile`
* `~/Code/work` (projects from my job) -> `gitconfig.gitlab.profile`

This configuration is completely free to change profiles or folders where define the profiles. To set what profile to use in specific folder
only need to create link to profile and ensure folders are exist:
```
ln -sf $HOME/.dotfiles/git/profiles/gitconfig.github.profile $HOME/Code/me/.gitconfig.profile
ln -sf $HOME/.dotfiles/git/profiles/gitconfig.gitlab.profile $HOME/Code/work/.gitconfig.profile
```

## SSH file definition by hostname
For security I will like to use different SSH keys by each service are using, for this reason I created `git.hosts` configuration file, depends the
hostname we use different folder where are set the SSH key.
Feel free to change hosts configuration, but you need to ensure folders where store SSH keys already exist:
```
mkdir ~/.ssh/github ~/.ssh/gitlab
ln -sf $HOME/.dotfiles/git/ssh/hosts.config $HOME/.ssh/git.hosts
```

## How to use GPG
This part is not required but is highly recommended.
I write here some useful GPG commands if I will like generate new GPG key. 
Generate a GPG key pair:
```
gpg --default-new-key-algo rsa4096 --gen-key
```
Use next command to list the long form of the GPG keys for which you have both a public and private key:
```
gpg --list-secret-keys --keyid-format=long
```
Remember to sign commits with GPG you need change value from `gpgsign` to `true` from `gitconfig` file.

Here I can find more info about this: [https://docs.github.com/en/authentication/managing-commit-signature-verification](https://docs.github.com/en/authentication/managing-commit-signature-verification)

## Run script
I created script to automate all this explained steps.
```
sh ./install.sh
```