path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /opt/homebrew/opt/rustup/bin
  # Exclude empty folders. Disable safaridriver as not used
  ${path:#(/System/Cryptexes/App/usr/bin|/var/run/com.apple.security.cryptexd/*|/opt/pmk/env/global/bin)}
)

export EDITOR='/opt/homebrew/bin/nvim'

export LESS="-R --mouse --wheel-lines=3"