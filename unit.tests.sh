#!/bin/sh

set -e

echo "Running Unit Tests"
cd Pushr.Test

dotnet -restore
dotnet test --no-restore