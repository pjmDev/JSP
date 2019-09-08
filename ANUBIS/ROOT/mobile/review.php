<?php
include("../lib/publicCharset.php");
include("../lib/publicDB.php");
?>
<style>
	body {margin:0; padding:0;}
	.topframe {background:black; color:#ffffff; margin:0 0 0 0; width:100%;  height:35px; padding: .5em 0 0 .5em;}
	.tab01 {width:100%; border-collapse:collapse; display:inline-block;}
	.tab01 td {width:250px; border-top:1px solid; border-bottom:1px solid; border-right:1px solid; }
	</style>
<script src="local.js" type="text/javascript" charset='utf-8'></script>
<script>
	function goWrite(){
		//this.txtLoname.value = txtLoname;
		alert("Write");
		f.target='_self';
		f.action='write.php';
		f.submit();
	}
	
	function goUpdate(lonum){
		//this.txtLoname.value = txtLoname;
		f.lonum.value = lonum;
		alert("Update");
		f.target='_self';
		f.action='write.php';
		f.submit();
	}
	
	function goDelete(lonum){
		//this.txtLoname.value = txtLoname;
		f.lonum.value = lonum;
		alert("Delete");
		f.target='_self';
		f.action='delete.php';
		f.submit();
	}
	</script>
	
<?php
	echo "<body>";
	echo "<form name='f' method='get'>";
	$db = new mDB();
	$strSQL = "select * from tb_location where lonum = ".$_REQUEST["lonum"]." ";
	$rs = new mRS($db, $strSQL);
	$rs->next();
	echo "<div class='topframe'>".$rs->f("loname")."(".$rs->f("lobcate").">".$rs->f("lomcate").">".$rs->f("loscate").") <input type='button' value='편집' onClick=\"goWrite()\"></div>  ";
	$rs->close();
	$db->close();
	$db=null;

	echo "<input type='hidden' name='lonum' value=''>";

	echo "<table class='tab01'>";
	echo "<tr>";
	echo "<td rowspan='4' width='230px' height='290px'><p align='center'><img src='../image/goaja.jpg' width='210px' height='240px'></p></td>";
	
	echo "<td style='border-right:none; height:50px;'>이름 : 감성골</td>";
	echo "</tr>";
	
	echo "<tr>";
	echo "<td style='border-right:none; height:50px;'>업종 : 식당</td>";
	echo "</tr>";
	
	echo "<tr>";
	echo "<td style='border-right:none; height:50px;'>전화번호 : 000-0000-0000</td>";
	echo "</tr>";
	
	echo "<tr>";
	echo "<td style='border-right:none;'></td>";
	echo "</tr>";
	
	echo "</table>";
	
echo "</form>";	 
echo "</body>";

?>	