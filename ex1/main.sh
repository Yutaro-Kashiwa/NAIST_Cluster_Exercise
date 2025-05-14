#!/bin/bash
# Check if project.txt exists
if [[ ! -f ../projects.txt ]]; then
  echo "projects.txt not found!"
  exit 1
fi
target_count=$1
# Create a directory to clone repositories
mkdir -p cloned_repos

count=1
# Read the repository name from projects.txt
while IFS= read -r repo_name; do
  cd cloned_repos || exit
  # Clone the repository
  if [[ -d "$repo_name" ]]; then
  	echo "  Repository already exists"
  else
   	echo "  Cloning starts"
   	echo https://github.com/$repo_name
 	  git clone https://github.com/$repo_name $repo_name
  fi

  java -jar ./DesigniteJava.jar -i cloned_repos/$repo_name -o ./outputs

done < projects.txt