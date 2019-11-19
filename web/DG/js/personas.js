/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function functionDA() {
      // Get the checkbox
      var checkBox = document.getElementById("EditModalCheckboxDA");
      // Get the output text
      var cda = document.getElementById("comboboxDA");

      // If the checkbox is checked, display the output text
      if (checkBox.checked === true){
          checkBox.value = "true";
        cda.style.display = "block";
      } else {
          checkBox.value = "false";
        cda.style.display = "none";
      }
    }
      
     $(document).on("click", ".editar-Persona", function () {

     var codigo = $(this).data('id');
     $(".modal-body  #codigoPucpUsuario").val(  codigo );
     $(".modal-body .form-group #nombreUsuario").val(  $(this).data('nombre') );
     $(".modal-body .form-group #correoPucpUsuario").val(  $(this).data('correo') );
     $(".modal-body .form-group #condicionUsuario").val(  $(this).data('condicion') );
     $(".modal-body .form-check #EditModalCheckboxDA").prop("checked", false);
     
     $('.modal-footer #buttonBanPersona').data('id',codigo);
     var aaa = $(this).data('rol');
     
     if($(this).data('condicion') === "Egresado"  || (aaa.toString()==="3")){
         $(".modal-body .form-check #EditModalCheckboxDA").prop("disabled", true);
         functionDA(); 
     }

    else{
        $(".modal-body .form-check #EditModalCheckboxDA").prop("disabled", false);
        $(".modal-body .form-group #actividadEscogida").val("0" );
        var rol = $(this).data('rol');
        var actividad = $(this).data('idact');

        if (rol.toString()==="2"){
            $(".modal-body .form-check #EditModalCheckboxDA").prop("checked", true);
            $(".modal-body .form-group #actividadEscogida").val(actividad );
        }
        
        functionDA(); 
        }
        });
      
      //codigoPucpUsuarioBorrar
      $(document).on("click", ".borrar-Persona", function () {
          $(".modal-body  #codigoPucpUsuarioBorrar").val(  $(this).data('id') );
      });
      
      $(document).on("click", ".ban-Persona", function () {
          $(".modal-body  #codigoPucpUsuarioBanear").val($(this).data('id') );
      });
      
           

      
  