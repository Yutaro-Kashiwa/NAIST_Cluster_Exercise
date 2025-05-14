#!/bin/bash
# Check if project.txt exists
if [[ ! -f projects.txt ]]; then
  echo "projects.txt not found!"
  exit 1
fi
target_count=$1
# Create a directory to clone repositories
mkdir -p cloned_repos

count=1
# Read the repository name from projects.txt
while IFS= read -r repo_name; do
  # 並列処理用プログラム
  echo "--$count-----------------------"
  if [[ -n "$target_count" && $count -eq $target_count ]]; then
    echo "Processing repository: $repo_name"
    ((count++))
  else
    echo "SKIP: $repo_name"
    ((count++))
    continue
  fi
  pwd
  cd cloned_repos || exit


  # Clone the repository
  if [[ -d "$repo_name" ]]; then
  	echo "  Repository already exists"
  else
   	echo "  Cloning starts"
   	echo https://github.com/$repo_name
 	  git clone https://github.com/$repo_name $repo_name
  fi
  cd ..

  java -jar ./DesigniteJava.jar -i cloned_repos/$repo_name -o ./outputs/$repo_name

done < projects.txt