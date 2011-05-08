$(document).ready(function(){
  $("#section-foreing").live("mouseover", function(){
    $("#message-frame").html("<span>No hemos podido encontrar una fuente de datos para conocer de forma detallada como se reparte este presupuesto. Si la conoces, ¡compártela!</span>")
    $("#message-frame").show();
  });

  $("#section-foreing").live("mouseleave", function(){
    $("#message-frame").hide();
  });

  $("#section-environmental").live("mouseover", function(){
    $("#message-frame").html("<span>No hemos podido encontrar una fuente de datos para conocer de forma detallada como se reparte este presupuesto. Si la conoces, ¡compártela!</span>")
    $("#message-frame").show();
  });

  $("#section-environmental").live("mouseleave", function(){
    $("#message-frame").hide();
  });

  $("#search-frame button").live("click", function(){
    $("#message-frame").html("<span>¡Ups nos has pillado! El buscador no pudo ser finalizado en el plazo de Abredatos, ¡lo sentimos!</span>")
    $("#message-frame").show();
  })
});