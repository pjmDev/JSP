<!DOCTYPE html>
<html>
<head>
<title>test</title>
<style>

@font-face {
	font-family: "Noto Sans KR";
	src:
	url("/fu/data/font/NotoSansKR-Regular.otf") format("embedded-opentype"), 
	url("/fu/data/font/NotoSansKR-Regular.woff") format("woff"),
	url("/fu/data/font/NotoSans-Regular.ttf") format("truetype"),
	url("/fu/data/font/NotoSans-Regular.woff") format("woff"),
	url("/fu/data/font/NotoSans-Regular.eot?#iefix") format("embedded-opentype");
	font-weight: normal;
	font-style: normal; }
@import url(https://cdn.rawgit.com/singihae/Webfonts/master/style.css);
	* {font-size:64px; }
	.test {font-family:'BM JUA','배달의민족 주아',sans-serif;}
	.test2 {font-family:'BM HANNA','배달의민족 한나', sans-serif; }
	.test3 {font-family: DOHYEON; }
</style>
</head>
<body>
<div>가나다라마바사아자차카타파하</div>
<div class="test">가나다라마바사아자차카타파하</div>
<div class="test2">가나다라마바사아자차카타파하</div>
<div class="test3">가나다라마바사아자차카타파하</div>
</body>
</html>