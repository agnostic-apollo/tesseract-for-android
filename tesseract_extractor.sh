#!/bin/bash
#title:          tesseract_extractor.sh
#description:    Extracts tesseract binaries of all APP_ABIs, appends APP_ABI to each binary and then zips all the binaries
#author:         agnostic-apollo
#usage:          tesseract_extractor.sh
#date:           1-Aug-2019
#versions:       1.0
#license:        MIT License

#APP_ABIS="armeabi-v7a x86 arm64-v8a x86_64"
tesseract_in_dir="tess-two/tess-two/obj/local"
tesseract_out_dir="tesseract-out"
build_timestamp="$(date +"%Y-%m-%d %H.%M.%S")"


if [ ! -d "$tesseract_in_dir" ]; then
	echo "Failed to find tesseract_in_dir at $tesseract_in_dir"
	exit 1
fi

if [ -d "$tesseract_out_dir" ]; then
	rm -rf "$tesseract_out_dir"
	if [ $? -ne 0 ]; then
	echo "Failed to remove $tesseract_out_dir"
	exit 1
	fi
fi

mkdir -p "$tesseract_out_dir"
if [ ! -d "$tesseract_out_dir" ]; then
	echo "Failed to create $tesseract_out_dir"
	exit 1
fi

tesseract_binary_found=0
for APP_ABI_DIR in "$tesseract_in_dir"/*; do

	if [ ! -d "$APP_ABI_DIR" ]; then
		continue
	fi

	APP_ABI="$(basename "$APP_ABI_DIR")"

	tesseract_binary_path="$APP_ABI_DIR"

	if [ -f "$tesseract_binary_path/tesseract" ]; then
		tesseract_binary_found=1
		cp -fa "$tesseract_binary_path/tesseract" "$tesseract_out_dir/tesseract-$APP_ABI"
	fi
done

if [ $tesseract_binary_found -eq 1 ]; then
	tesseract_out_zip="$tesseract_out_dir-$build_timestamp.zip"
	echo "Building tesseract_out_zip at $tesseract_out_zip"
	cd "$tesseract_out_dir"
	zip "$tesseract_out_zip" ./*
	echo "Complete"
fi
