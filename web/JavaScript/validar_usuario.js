function validar() {
	var nombre,apellido1,apellido2,telefono,direccion,correo,contraseña,expresionMail,expresionTel,expresionContra;
	nombre=document.getElementById("nombre").value;
	apellido1=document.getElementById("apellido1").value;
	apellido2=document.getElementById("apellido2").value;
	telefono=document.getElementById("tel").value;
	direccion=document.getElementById("direccion").value;
	correo=document.getElementById("email").value;
	contraseña=document.getElementById("contra").value;
	expresionMail=/^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$/;
	expresionTel= /^(\(\+?\d{2,3}\)[\*|\s|\-|\.]?(([\d][\*|\s|\-|\.]?){6})(([\d][\s|\-|\.]?){2})?|(\+?[\d][\s|\-|\.]?){8}(([\d][\s|\-|\.]?){2}(([\d][\s|\-|\.]?){2})?)?)$/;
	expresionContra=/[0-9a-zA-Z]/;
	
	if(!correo.match(expresionMail)){
		return false;
	}
	else if(!telefono.match(expresionTel)){
                return false;   
	}
	else if(!contraseña.match(expresionContra) || contraseña.length>20){
                return false;

	}
	else{
		return true;
                
	}
	

}
function validarn(e){
	var teclado=(document.all) ? e.keycode : e.which;
	var patron=/[0-9]/;
	var tec=String.fromCharCode(teclado);
	return patron.test(tec);
}
function validars(e){
	var teclado=(document.all) ? e.keycode : e.which;
	var patron=/[a-zA-Z\s]/;
	var tec=String.fromCharCode(teclado);
	return patron.test(tec);

}
function validarz(e){
	var teclado=(document.all) ? e.keycode : e.which;
	var patron=/[0-9-a-zA-Z\s-#$]/;
	var tec=String.fromCharCode(teclado);
	return patron.test(tec);

}

function respuestaSi(){
   var input = document.getElementById("administrador");
   var res = document.getElementById("confirmacion");
           input.disabled = false;
           input.required= true;
           input.style.display = 'block';
           res.value = 1;
}
function respuestaNo(){
   var input = document.getElementById("administrador");
   var res = document.getElementById("confirmacion");
           input.disabled = true;
           input.required= false;
           input.style.display = 'none';
           res.value = 0;
}
function validarc(e){
	var teclado=(document.all) ? e.keycode : e.which;
	var patron=/[0-9-a-zA-Z\s]/;
	var tec=String.fromCharCode(teclado);
	return patron.test(tec);

}
function validara(e){
	var teclado=(document.all) ? e.keycode : e.which;
	var patron=/[0-9-a-zA-Z@.]/;
	var tec=String.fromCharCode(teclado);
	return patron.test(tec);

}
