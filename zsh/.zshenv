# guide to zsh dotfiles: https://unix.stackexchange.com/a/71258
#   - `.zshenv` is always sourced. It often contains exported variables that 
#      should be available to other programs. 

# lines in this file should look like this:
export PYQR_IMPORTANT_ENVVAR=important_value

# import secrets, but warn if still encrypted
zshenv_secret="$HOME/.zshenv-secret"
if [ -f $zshenv_secret ]; then
  is_encrypted=$(head -n1 $zshenv_secret | grep --no-messages "ANSIBLE_VAULT")
  if [ $is_encrypted ]; then
    echo "WARNING: $zshenv_secret is encrypted. To decrypt: ~/.dotfiles-secret/decrypt.sh"
  else
    source "$zshenv_secret"
  fi
fi