function validacao() {
  let nome = document.getElementById("validationCustom01").ariaValueMax;
  if(nome == ""){
    alert("Nome vazio");
    return false;
  }
}