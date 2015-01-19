all:	content combine

content:	presentation.md
		markdown presentation.md > assets/content.html

combine:	assets/head.html assets/content.html assets/tail.html
		cat assets/head.html assets/content.html assets/tail.html > presentation.html
