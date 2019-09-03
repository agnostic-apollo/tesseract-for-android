# Tesseract For Android

The official repository of tesseract can be found [here](https://github.com/tesseract-ocr/tesseract).
The repository with android compilation support can be found [here](https://github.com/rmtheis/tess-two) and its port which this repository uses can be found [here](https://github.com/alexcohn/tess-two).


## Pre-compiled tesseract static binaries

The binaries for `armeabi-v7a x86 arm64-v8a x86_64` are available [here](https://github.com/agnostic-apollo/tesseract-for-android/releases).


## Cross Compile Instructions for Android Using NDK

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

## Install Instructions For Termux In Android

The `tesseract` file should be placed in `termux` bin directory and have `termux uid:gid` ownership and have executable `700` permission before it can be run with `termux` terminal.

- Copy the file to `/data/data/com.termux/files/usr/bin`.

	Either `cd` to the download/extraction directory and run following command.
	```
	cat tesseract > /data/data/com.termux/files/usr/bin/tesseract
	```

	Or you can use a file browser like `Root Explorer` to copy the file to the `termux` bin dir which will probably set `root` ownership and non executable permission to the `tesseract` file. 

- Set correct ownership and permissions. You can also set ownership and permission with the file browser manually.
	```
	bin_path="/data/data/com.termux/files/usr/bin"; for f in tesseract; do if [ -f "$bin_path/$f" ]; then chown root:root "$bin_path/$f" && chmod 700 "$bin_path/$f"; fi; done;
	```

## Test `tesseract`

- Download trained language data file for your language and 4.1 from [here](https://github.com/tesseract-ocr/tessdata/tree/master). For `english` the file is `eng.traineddata`.

- Then create `tessdata` directory in `termux` home and place the trained language data file `eng.traineddata` in it or whatever file you downloaded.

- Test OCR on a test jpg with following commands.

	To print output text to stdout
	```
	tesseract --tessdata-dir tessdata test.jpg stdout
	```

	To print output text to a file
	```
	tesseract --tessdata-dir tessdata test.jpg test.txt
	```

