all:	out/index.html

out/index.html:	Makefile talk.rst css/talk.css css/talk_dark.css \
 images/sp-adam.png 
	hovercraft talk.rst out

clean:
	rm -rf out/index.html out/js out/css out/images

