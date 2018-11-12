<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src=" https://code.jquery.com/jquery.js">	
</script>
<script
	src=" https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js">
	
</script>
<link rel="stylesheet"
	href=" https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilos.css">
<title>Consulta</title>
</head>
<style>
	html,body {
	  height: 100%;
	  width: 100%;
	  margin: 0;
	  display: flex;
	  flex-direction: column;
	  flex-wrap: wrap;	  
	}
	.boton-salir{
		text-decoration:none;
		font-weight: 600;
		font-size: 20px;
		color: white;
		padding-top:15px;
		padding-bottom:15px;
		padding-left:40px;
		padding-right:40px;
		background-color:red;
		border-color: #d8d8d8;
		border-width: 3px;
		border-style: solid;
		border-radius:35px;	
		}
	tr:hover {background-color: #D5D5D5;}
	table {
		font-size: 15px;
		width: 50%;
		height: 150px;
		text-align: center;
	}
</style>
<body>
	<p>
	<h2 align="center">Listado de incidencias</h2>
	</p>

	<form name="normal" method="post">
		<table align="center" border="1" width: 100% id="tab">
			<thead bgcolor="#FFFD86">
			<tr>				
				<th width="30">Fecha Inicio</th>
				<th width="30">Fecha Fin</th>
			</tr>
			</thead>
			<tbody bgcolor="#FFD27D">
			
			<c:forEach items="${incidencias}" var="proyecto">
				<tr>
					
					<td style="display: none">${proyecto.idEmpleado}</td>
					<td style="display: none">${proyecto.tipo}</td>
					<td style="display: none">${proyecto.mensaje}</td>
					<td >${proyecto.fechaInicio}</td>
					<td >${proyecto.fechaFin}</td>
					<td style="display: none">${proyecto.comentario}</td>
					
			
				</tr>
		</c:forEach>
			</tbody>
		
		</table>		
    
		<input name="idEmpleado" id="dni"  value="" style="display:none"> 
		<input name="tipo" id="tip"  value="" style="display:none"> 
		<input name="mensaje" id="mens"  value ="" style="display:none"> 
		<input name="fechaInicio" id="fechIn"  value ="" style="display:none"> 
		<input name="fechaFin" id="fechFin"  value="" style="display:none"> 
		<input name="comentario" id="com"  value ="" style="display:none"> 
		
		
      
   
         <input type="submit"  value="consultar" id="modificar" onClick="verIncidencia()" class="EstiloBoton"></input>
        
        </p>

</form>
</body>


<script type="text/javascript">

var seleccionado=null;            // tendremos la fila necesaria

function onclickHandler() {
        if(seleccionado==this) {
            this.style.backgroundColor="transparent";
            seleccionado=null;
        }
        else {
            if(seleccionado!=null) 
                seleccionado.style.backgroundColor="transparent";
            this.style.backgroundColor="#e1b";
            seleccionado=this;
        }
        
    }

var fil=document.getElementById("tab").getElementsByTagName("tr");
for(var i=0; i<fil.length; i++) {
    fil[i].onclick=onclickHandler;

}


function verIncidencia() {
    if(seleccionado==null) {
    	 alert("Seleccione una fila haciendo click sobre ella");
    	 document.normal.action= "EmplConlInc.htm";
          
    }
    var f=seleccionado.getElementsByTagName('td'); 
    var datoCoger= f[0].textContent;
    var datoC= f[1].textContent;
    var datoCg= f[2].textContent;
    var datoCoge= f[3].textContent;
    var datoCogerr= f[4].textContent;
    var datoCogerria= f[5].textContent;
  document.getElementById("dni").value=datoCoger;
  document.getElementById("tip").value=datoC;
  document.getElementById("mens").value=datoCg;
  document.getElementById("fechIn").value=datoCoge;
  document.getElementById("fechFin").value=datoCogerr;
  document.getElementById("com").value=datoCogerria;
	
    

    document.normal.action= "Incidencias.htm";

}
function retroceder(){
	
	

	document.addTarea.action = "home.htm";


}

</script>  
</html>
	