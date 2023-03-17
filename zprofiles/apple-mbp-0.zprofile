export MY_HOST_ID='work-mbp-0'

# export GENERATOR="-G Ninja"

# a bug in openmpi 4.0.3
# export PMIX_MCA_gds=hash
eval $(/opt/homebrew/bin/brew shellenv)
source $(brew --prefix)/share/antigen/antigen.zsh

export PATH="/opt/miniconda3/bin:$PATH"
export PATH="/Users/guihaoliang/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
