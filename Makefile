all:	out/index.html

out/index.html:	Makefile talk.rst css/talk.css css/talk_dark.css \
 images/sp-adam.png images/Learn-Go.png out/favicon.ico
	hovercraft talk.rst out

out/favicon.ico: images/favicon.ico
	install -m0644 images/favicon.ico out/favicon.ico

clean:
	rm -rf out/index.html out/js out/css out/images

