function FormAppendChild(f, key_name, key_value) {
		var obj = document.getElementById(key_name);
		var obj2 = document.getElementsByName(key_name);
		if ( obj == null && obj2.length == 0) {
			var ctl = document.createElement("input");
			ctl.setAttribute("type", "hidden");
			ctl.setAttribute("name", key_name);
			ctl.setAttribute("value", key_value);
			f.appendChild(ctl);
		}
		else {
			if (obj != null)
				obj.value = key_value;
			else if (obj2 != null)
				obj2[0].value = key_value;
		}
}