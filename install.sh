# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle

# Install VSCode extensions
code --install-extension Angular.ng-template
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.jshint
code --install-extension eamodio.gitlens
code --install-extension ecmel.vscode-html-css
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.terminal
code --install-extension jakethashi.vscode-angular2-emmet
code --install-extension johnpapa.Angular2
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension natewallace.angular2-inline
code --install-extension PKief.material-icon-theme
code --install-extension pmneo.tsimporter
code --install-extension rbbit.typescript-hero
code --install-extension thekalinga.bootstrap4-vscode
code --install-extension vscode-icons-team.vscode-icons
code --install-extension xabikos.JavaScriptSnippets

# Configure iTerm2 profile

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Configure profile
dir=~/dotfiles
files=".zshrc .gitconfig .p10k.zsh"

# Create a dir to move the configuration files there
cd $dir

for file in $files; do
    echo "Creating symlink to $file in home directory."
    [ -e ~/$file ] && rm ~/$file
    ln -s $dir/$file ~/$file
done

# Change MacOS configuration
source .macos

# Change default shell
chsh -s /bin/zsh