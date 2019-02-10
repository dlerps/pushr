#!/bin/sh

set -e

echo "Building Application"
cd Pushr

dotnet restore
dotnet build --no-restore