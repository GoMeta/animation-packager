#!/bin/sh

# Run copySceneKitAssets on each dae
for folder in $1/dae/**
do
  mkdir $folder/.xml # mv * will skip dotfiles, so we won't try to recursively move
  mv $folder/* $folder/.xml
  mv $folder/.xml $folder/xml
  ./helpers/copySceneKitAssets $folder/xml -o $folder/$(basename $folder).scnassets
done

# Delete DS_Store files before archiving
find $1 -name ".DS_Store" -delete

# Archive the entire directory structure
pushd $1
FOLDER_NAME=$(basename $1)

zip -r ../$FOLDER_NAME.meta.zip .
popd

# Cleanup
for folder in $1/dae/**
do
  mv $folder/xml/* $folder
  rm -rf $folder/xml
  rm -rf $folder/*.scnassets
done
