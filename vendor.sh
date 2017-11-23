#!/usr/bin/env sh

# PATH=${HOME}/homebrew/bin:$PATH
DIRNAME="$( cd $(dirname "$0"); pwd -P )"


# Cellar
if [ ! -d "/Applications/Foxy.app/Resources/.homebrew" ]; then

  # Brew
  if [ ! -d "/Applications/Foxy.app/Resources/.homebrew" ]; then
    git clone https://github.com/mxcl/homebrew.git /Applications/Foxy.app/Resources/.homebrew
  fi
  /Applications/Foxy.app/Resources/.homebrew/bin/brew update
  /Applications/Foxy.app/Resources/.homebrew/bin/brew install --build-bottle pkg-config portaudio flac libpng mad sox opus opus-tools
  rm -rf root/Applications/Foxy.app/Resources/.homebrew
  cp -af /Applications/Foxy.app/Resources/.homebrew root/Applications/Foxy.app/Resources
fi

# sox: https://sourceforge.net/projects/sox/files/latest/download?source=files

# Node
if [ ! -d "root/Applications/Foxy.app/Resources/node" ]; then
  mkdir root/Applications/Foxy.app/Resources/node
  wget -qO- https://nodejs.org/dist/v7.10.1/node-v7.10.1-darwin-x64.tar.gz | tar xvz -C root/Applications/Foxy.app/Resources/node --strip-components=1
fi

if [ ! -f "root/Applications/Foxy.app/Resources/foxycli/resources/Hey_Foxy.pmdl.original" ]; then
  cp -rf .defaults/resources/* root/Applications/Foxy.app/Resources/foxycli/resources
fi

# Client Dependencies
if [ ! -d "root/Applications/Foxy.app/Resources/foxycli/node_modules" ]; then
  cd root/Applications/Foxy.app/Resources/foxycli
  npm i
  cd $DIRNAME
fi

# Extension Dependencies
if [ ! -d "foxyext/node_modules" ]; then
  cd foxyext
  npm i
  cd $DIRNAME
fi

exit 0
