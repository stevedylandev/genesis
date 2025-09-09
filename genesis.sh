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
echo "Installing Foundry..."
curl -fsS https://foundry.paradigm.xyz | bash > /dev/null 2>&1
echo "✔️ Foundry installed"

# Install foundry
foundryup > /dev/null 2>&1

# Install Hardhat
echo "Installing Hardhat..."
if command -v pnpm >/dev/null 2>&1; then
    pnpm install -g hardhat > /dev/null 2>&1
elif command -v npm >/dev/null 2>&1; then
    npm install -g hardhat > /dev/null 2>&1
elif command -v bun >/dev/null 2>&1; then
    bun install -g hardhat > /dev/null 2>&1
else
    echo "No package manager found (pnpm, npm, or bun)"
fi
echo "✔️ HardHat installed"


# Create wallet
echo "❯ What do you want to name your wallet?"
read wallet_name
cast wallet new --password ~/.foundry/keystores $wallet_name
echo "✔️ Wallet created"

echo "
✔️ Installation complete!

Start a new project with 'forge init counter'
"
