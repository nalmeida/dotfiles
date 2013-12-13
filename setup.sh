#!/bin/bash

echo " "
echo " ➔ Setting executable permission to .bash_profile"
sudo chmod +x .bash_profile

echo " ➔ Setting executable permission to bin/*"
sudo chmod -R +x bin/*

echo " ✔ Done"
echo ""