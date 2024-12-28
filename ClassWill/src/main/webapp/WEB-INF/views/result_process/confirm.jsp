<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

	if(confirm("${msg}")) {
		location.href="${targetURL}";
		if("${targetURL}" == ""){
			history.back();
		} 
	} else {
		history.back();
	}


</script>



