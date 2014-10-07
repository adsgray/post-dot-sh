# post.sh

## usage
./post.sh \[slug\]

## what happens
- post.sh creates the post file in posts/YEAR/MONTH/DAY/slug.html and opens up vi
- after you save the file and exit vi, regen.sh will run to re-create posts/index.shtml with the 5 most recent posts
- the permalink of the post is posts/YEAR/MONTH/DAY/slug.shtml
- also, posts/genmonths.sh will run to re-create the month index pages that live at posts/YEAR/MONTH/index.shtml
- genmonths.sh also re-creates posts/archive.shtml, which contains links to all month index pages.

## requirements
- bash
- Apache with Server Side Includes enabled for .shtml files

## why did I make this?
(http://tilde.club)
