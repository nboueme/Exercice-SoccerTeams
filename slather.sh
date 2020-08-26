#!/bin/bash

if which slather >/dev/null; then
  slather coverage --html --scheme SoccerTeams --workspace SoccerTeams.xcworkspace SoccerTeams.xcodeproj
else
  echo "warning: slather not installed, download from https://github.com/SlatherOrg/slather"
fi 
