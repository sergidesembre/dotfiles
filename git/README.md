# Dotfile git configuration

## Resume
* [Git aliases](#git-aliases)
* [Global git ignore](#global-git-ignore)
* [Custom git commit message](#custom-git-commit-message)
* [Git configuration for multiple profiles (GitHub, GitLab, Bitbucket, ...)](#git-configuration-for-multiple-profiles)
* [SSH file definition by hostname](#ssh-file-definition-by-hostname)
* [How to use GPG](#how-to-use-gpg)

## Git aliases
For git I usually use the aliases from [plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) of oh-my-zsh.

If I need to define another custom aliases I can update `.gitconfig.aliases` file to write my alias.
For do this it's necessary create link:
```
ln -sf ~/.dotfiles/git/.gitconfig.aliases ~/.gitconfig.aliases
```

## Global git ignore
In `.gitignore.global` file I can define files or folder to ignore when does commit.
To use the global git ignore we need to create link:
```
ln -sf ~/.dotfiles/git/.gitignore.global ~/.gitignore.global
```

## Custom git commit message
I have a custom git message when commit files where are define the title, description, type of issue or ticket number if it's necessary.
If I like to use this we need to crete link:
```
ln -sf ~/.dotfiles/git/.gitmessage ~/.gitmessage
```
When I write the commit message I like to set the title or type of issue correctly, so I created some rules in `gitcommit.nanorc` (only 
for nano editor) to hightlight with colors if it's wrong or ok the message.
To add this configuration in own nano editor needs to do the next steps (ensure you exist folders):
```
ln -sf ~/.dotfiles/git/editor/nano/gitmessage.nanorc ~/.config/nano/gitmessage.nanorc
echo 'include ~/.config/nano/gitmessage.nanorc' >> ~/.config/nano/.nanorc
```

## Git configuration for multiple profiles
Ok! In my case I will like to use different git accounts depends the project (personal or company), fot this reason I set configured 
my `.gitconfig` file to use different profiles by folder:
* `~/Code/me` (personal projects) -> `.gitconfig.github.profile`
* `~/Code/work` (projects from my job) -> `.gitconfig.gitlab.profile`

This configuration is completely free to change profiles or folders where define the profiles. To set what profile to use in specific folder
only need to create link to profile and ensure folders are exist:
```
ln -sf ~/.dotfiles/git/profiles/.gitconfig.github.profile ~/Code/me/.gitconfig.profile
ln -sf ~/.dotfiles/git/profiles/.gitconfig.gitlab.profile ~/Code/work/.gitconfig.profile
```

## SSH file definition by hostname
For security I will like to use different SSH keys by each service are using, for this reason I created `git.hosts` configuration file, depends the
hostname we use different folder where are set the SSH key.
Feel free to change hosts configuration, but you need to ensure folders where store SSH keys already exist:
```
mkdir ~/.ssh/github ~/.ssh/gitlab
ln -sf ~/.dotfiles/git/git.hosts ~/.ssh/git.hosts
```

## How to use GPG
@TODO: Pending to complete