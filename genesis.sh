#!/bin/bash
echo "

 ██████  ███████ ███    ██ ███████ ███████ ██ ███████ 
██       ██      ████   ██ ██      ██      ██ ██      
██   ███ █████   ██ ██  ██ █████   ███████ ██ ███████ 
██    ██ ██      ██  ██ ██ ██           ██ ██      ██ 
 ██████  ███████ ██   ████ ███████ ███████ ██ ███████ 
                                                      
                                                      
Where building on Ethereum begins
                                     

"

# Install foundryup
printf "Installing Foundry..."
curl -fsS https://foundry.paradigm.xyz | bash > /dev/null 2>&1
printf "\r✔️ Foundry installed    \n"

# Install foundry
foundryup > /dev/null 2>&1

# Install Hardhat
printf "Installing Hardhat..."
if command -v pnpm >/dev/null 2>&1; then
    pnpm install -g hardhat > /dev/null 2>&1
elif command -v npm >/dev/null 2>&1; then
    npm install -g hardhat > /dev/null 2>&1
elif command -v bun >/dev/null 2>&1; then
    bun install -g hardhat > /dev/null 2>&1
else
    printf "\rNo package manager found (pnpm, npm, or bun)\n"
    exit 1
fi
printf "\r✔️ HardHat installed    \n"


# Create wallet
echo "❯ What do you want to name your wallet?"
read wallet_name
cast wallet new --password ~/.foundry/keystores $wallet_name

echo "
✔️ Installation complete!

Start a new project with 'forge init counter'
"
