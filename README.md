# tesseract-for-android

This repository provides cross compile instructions and compiled binaries of tesseract for Android. 
The official repository of tesseract can be found [here](https://github.com/tesseract-ocr/tesseract).
The repository with android compilation support can be found [here](https://github.com/rmtheis/tess-two) and its port which this repository uses can be found [here](https://github.com/alexcohn/tess-two).
##


### Contents
- [Compatibility](#Compatibility)
- [Dependencies](#Dependencies)
- [Downloads](#Downloads)
- [Install Instructions For Termux In Android](#Install-Instructions-For-Termux-In-Android)
- [tesseract Usage](#tesseract-Usage)
- [Cross Compile Instructions for Android Using NDK](#Cross-Compile-Instructions-for-Android-Using-NDK)
- [Current Features](#Current-Features)
- [Planned Features](#Planned-Features)
- [Issues](#Issues)
- [Worthy Of Note](#Worthy-Of-Note)
- [FAQs And FUQs](#FAQs-And-FUQs)
- [Changelog](#Changelog)
- [Contributions](#Contributions)
##


### Compatibility

- Android for `armeabi-v7a x86 arm64-v8a x86_64` archs. Users may want to run `tesseract` commands using [Termux App].
##


### Dependencies

`-`
##


### Downloads

- [GitHub releases](https://github.com/agnostic-apollo/tesseract-for-android/releases).
##


### Install Instructions For Termux In Android:

The `tesseract` file should be placed in termux `bin` directory `/data/data/com.termux/files/usr/bin` and it should have `termux` `uid:gid` ownership and have executable `700` permission before it can be run in the termux terminal without specifying its path.
1. Copy the file to termux bin directory:
	Either `cd` to the download/extraction directory and run following commands

	```
	cat tesseract > /data/data/com.termux/files/usr/bin/tesseract
	```

	Or use a file browser like root explorer to copy the file to the termux bin directory.

2. Set correct ownership and permission:
	Either run following commands to set them automatically, requires su binary to be in `$PATH`.

	```
	export termux_bin_path="/data/data/com.termux/files/usr/bin"; export owner="$(stat -c "%u" "$termux_bin_path")"; for f in tesseract; do if [ -f "$termux_bin_path/$f" ]; then su -c "chown $owner:$owner \"$termux_bin_path/$f\" && chmod 700 \"$termux_bin_path/$f\""; fi; done;
	```

	Or manually set them with your file browser. You can find `termux` `uid` and `gid` by running the command `id -u` in a non root shell in termux or by checking the properties of the termux `bin` directory from your file browser.

3. Download trained language data file for your language and 4.1 from [here](https://github.com/tesseract-ocr/tessdata/tree/master). For `english` the file is `eng.traineddata`.

4. Then create `/data/data/com.termux/files/home/image_text_searcher/tessdata` directory and place the trained language data file `eng.traineddata` in it or whatever trained language data file you downloaded. The `tessdata` directory is created inside the `image_text_searcher` directory to provide consistency with the [Image Text Searcher] project's default values.
##


### tesseract Usage

- Test OCR on a test jpg with following commands.

	To print output text to stdout
	```
	tesseract --tessdata-dir image_text_searcher/tessdata test.jpg stdout
	```

	To print output text to a file
	```
	tesseract --tessdata-dir image_text_searcher/tessdata test.jpg test.txt
	```
##


### Cross Compile Instructions for Android Using NDK

- Download Android NDK `r20` from [latest releases](https://developer.android.com/ndk/downloads) or [old releases](https://developer.android.com/ndk/downloads/older_releases.html) and extract to `$HOME/Android/ndk/android-ndk-r20`


- Get `tesseract` and `leptonica` source code

	Either clone this repository
	```
	https://github.com/agnostic-apollo/tesseract-for-android
	```

	Or clone `tess-two` repository by `alexcohn` which may be updated with latest versions.
	```
	git clone https://github.com/alexcohn/tess-two
	git clone --branch 4.1 https://github.com/alexcohn/tesseract tess-two/tesseract
	git clone https://github.com/alexcohn/leptonica tess-two/leptonica
	```

- Add NDK path to `$PATH`
	```
	PATH="$PATH:$HOME/Android/ndk/android-ndk-r20"
	```

- Compile With NDK

	Compile `tesseract` static binary for arm64-v8a
	```
	ndk-build -C tess-two/tess-two tesseract APP_ABI=arm64-v8a
	```

	Compile `tesseract` static binary for all APP_ABIs
	```
	ndk-build -C tess-two/tess-two tesseract APP_ABI="armeabi-v7a x86 arm64-v8a x86_64"
	```

- `tesseract` static binary should be compiled at tess-two/tess-two/obj/local/<APP_ABI>


- Extract and zip compiled `tesseract` binaries to tesseract-out directory with the format `tesseract-<APP_ABI>`. This step is optional.
	```
	bash tesseract_extractor.sh
	```

- Check if a compiled binary is the correct ABI
	```
	file tesseract-out/tesseract-<APP_ABI>
	```
##


### Current Features

`-`
##


### Planned Features

`-`
##


### Issues

`-`
##


### Worthy Of Note

`-`
##


### FAQs And FUQs

Check [FAQs_And_FUQs.md](FAQs_And_FUQs.md) file for the **Frequently Asked Questions(FAQs)** and **Frequently Unasked Questions(FUQs)**.
##

### Changelog

Check [CHANGELOG.md](CHANGELOG.md) file for the **Changelog**.

##


### Contributions

`-`
##


[Termux App]: https://github.com/termux/termux-app
[image_text_searcher]: https://github.com/agnostic-apollo/image_text_searcher
