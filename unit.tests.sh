#!/bin/sh

set -e

ls -l

echo "Running Unit Tests"
cd Pushr.Test

dotnet restore
dotnet test --no-restore