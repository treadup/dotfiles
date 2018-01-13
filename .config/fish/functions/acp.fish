function acp
  set -gx PATH $HOME/anaconda3/bin $PATH
  source (conda info --root)/etc/fish/conf.d/conda.fish
end
