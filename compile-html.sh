echo '' > index.html
alias doc='$@ >> index.html'
doc echo '<style>'
doc cat style.css
doc echo '</style>'
doc cmark README.md
