
function hideall() {
  $(residential2).hide();
  $(commercial).hide();
  $(corporate).hide();
  $(hybrid).hide();
  $(radiochoice2).hide();
  $(radiochoice4).hide();
  $(radiochoice3).hide();
  $(radiochoice1).hide();
  $(priceResidential).hide();
  $(priceHybrid).hide();
  $(priceCorporate).hide();
  $(commercialprice).hide();
  
};










function getSelectValue() {
  var residential = document.getElementById("residential");
  var selectedValue = document.getElementById("list").value;
  var commercial = document.getElementById("commercial");
  var corporate = document.getElementById("corporate");
  var hybrid = document.getElementById("hybrid");




  if (selectedValue == 'residential') {
      $(residential2).show();
  } else {
      document.getElementById('option-1').checked = false;
      document.getElementById('option-2').checked = false;
      document.getElementById('option-3').checked = false;
      $(residential2).hide();
      document.getElementById('floors1').value = "";
      document.getElementById('appartement').value = "";
      document.getElementById('basement1').value = "";
      $(priceResidential).hide();
      $(radiochoice4).hide();



  };
  if (selectedValue == 'commercial') {
      $(commercial).show();
  } else {
      document.getElementById('option-1-2').checked = false;
      document.getElementById('option-2-2').checked = false;
      document.getElementById('option-3-2').checked = false;
      $(commercial).hide();
      document.getElementById('parking1').value = "";
      document.getElementById('basement2').value = "";
      document.getElementById('cages').value = "";
      document.getElementById('basement1').value = "";
      document.getElementById('busisnesses').value = "";
      document.getElementById('floors').value = "";
      $(radiochoice3).hide();
      $(commercialprice).hide();
  };

  if (selectedValue == 'corporate') {
      $(corporate).show();
  } else {
      document.getElementById('option-1-3').checked = false;
      document.getElementById('option-2-3').checked = false;
      document.getElementById('option-3-3').checked = false;
      $(corporate).hide();
      document.getElementById('companies').value = "";
      document.getElementById('floors3').value = "";
      document.getElementById('basements').value = "";
      document.getElementById('basement1').value = "";
      document.getElementById('parking2').value = "";
      document.getElementById('occupant').value = "";
      $(radiochoice1).hide();
      $(priceCorporate).hide();
  };
  if (selectedValue == 'hybrid') {
      $(hybrid).show();
  } else {
      document.getElementById('option-1-4').checked = false;
      document.getElementById('option-2-4').checked = false;
      document.getElementById('option-3-4').checked = false;
      $(radiochoice2).hide();
      $(priceHybrid).hide();
      $(hybrid).hide();
      document.getElementById('busisnesses2').value = "";
      document.getElementById('floors4').value = "";
      document.getElementById('basements4').value = "";
      document.getElementById('hours').value = "1";
      document.getElementById('parking3').value = "";
      document.getElementById('occupant4').value = "";
  }
}

function hideresidential() {
  $(radiochoice4).hide(), $(priceResidential).hide();
  document.getElementById('option-1').checked = false;
  document.getElementById('option-2').checked = false;
  document.getElementById('option-3').checked = false;

}

function residential() {


  let floors = document.getElementById('floors1').value;
  let appartement = document.getElementById('appartement').value;
  let appDivFloors = appartement / floors;
  let elevator = appDivFloors / 6;
  let elevatortotal = Math.ceil(elevator);
  let ifmorethan = Math.ceil((floors-1) / 20);
  let colonne = 1 + ifmorethan;



  $(radiochoice4).show();
  if (document.getElementById('appartement').value.length == 0) {
      hideresidential();
  }
  if (document.getElementById('floors1').value.length == 0) {
      hideresidential();

  }
  if (document.getElementById('basement1').value.length == 0) {
      hideresidential();

  }

  document.getElementById('resultapp').innerHTML = elevatortotal * ifmorethan;
  document.getElementById('result1').innerHTML = colonne;
   console.log();




  


  if ($('#option-1').prop('checked')) {

          document.getElementById("price1").innerHTML = parseFloat(elevatortotal* ifmorethan * 7565).toFixed(2);
          document.getElementById("fees1").innerHTML = parseFloat(elevatortotal * ifmorethan * 7565 / 100 * 10).toFixed(2);
          document.getElementById("totalPrice1").innerHTML = parseFloat(elevatortotal * ifmorethan * 7565 * 1.10).toFixed(2);
          $(priceResidential).show();
      } else if ($('#option-2').prop('checked')) {
          document.getElementById("price1").innerHTML = parseFloat(elevatortotal * ifmorethan * 12345).toFixed(2);
          document.getElementById("fees1").innerHTML = parseFloat(elevatortotal * ifmorethan * 12345 / 100 * 13).toFixed(2);
          document.getElementById("totalPrice1").innerHTML = parseFloat(elevatortotal * ifmorethan * 12345 * 1.13).toFixed(2);
          $(priceResidential).show();
      } else if ($('#option-3').prop('checked')) {
          document.getElementById("price1").innerHTML = parseFloat(elevatortotal * ifmorethan * 15400).toFixed(2);
          document.getElementById("fees1").innerHTML = parseFloat(elevatortotal * ifmorethan * 15400 / 100 * 16).toFixed(2);
          document.getElementById("totalPrice1").innerHTML = parseFloat(elevatortotal * ifmorethan * 15400 * 1.16).toFixed(2);
          $(priceResidential).show();
      }

}
//Hide Commercial price and button
function hidecommercial() {
  document.getElementById('option-1-2').checked = false;
  document.getElementById('option-2-2').checked = false;
  document.getElementById('option-3-2').checked = false;
  $(radiochoice3).hide(), $(commercialprice).hide();
};

function commerc() {
  let cage = document.getElementById('cages').value;
  document.getElementById('numberofcages').innerHTML = cage
  $(radiochoice3).show();
  if (document.getElementById('floors').value.length == 0) {
      hidecommercial();
  }
  if (document.getElementById('cages').value.length == 0) {
      hidecommercial();

  }
  if (document.getElementById('basement2').value.length == 0) {
      hidecommercial();
  }

  if ($('#option-1-2').prop('checked')) {
      document.getElementById("price2").innerHTML = parseFloat(cage * 7565).toFixed(2);
      document.getElementById("fees2").innerHTML = parseFloat(cage * 7565 / 100 * 10).toFixed(2);
      document.getElementById("totalPrice2").innerHTML = parseFloat(cage * 7565 * 1.10).toFixed(2);
      $(commercialprice).show();
  } else if ($('#option-2-2').prop('checked')) {
      document.getElementById("price2").innerHTML = parseFloat(cage * 12345).toFixed(2);
      document.getElementById("fees2").innerHTML = parseFloat(cage * 12345 / 100 * 13).toFixed(2);
      document.getElementById("totalPrice2").innerHTML = parseFloat(cage * 12345 * 1.13).toFixed(2);
      $(commercialprice).show();
  } else if ($('#option-3-2').prop('checked')) {
      document.getElementById("price2").innerHTML = parseFloat(cage * 15400).toFixed(2);
      document.getElementById("fees2").innerHTML = parseFloat(cage * 15400 / 100 * 16).toFixed(2);
      document.getElementById("totalPrice2").innerHTML = parseFloat(cage * 15400 * 1.16).toFixed(2);
      $(commercialprice).show();
  }
}
//Hide Corporate price and button
function hidecorporate() {
  document.getElementById('option-1-3').checked = false;
  document.getElementById('option-2-3').checked = false;
  document.getElementById('option-3-3').checked = false;
  $(radiochoice1).hide(), $(priceCorporate).hide();
}


function occupantMulFloors() {
  let floors = document.getElementById("floors3").value;    // on la
  let occupant = document.getElementById("occupant").value;   //on la
  let basement = document.getElementById("basements").value;  //on la
  let totalfloors = +floors + +basement    //on la
  let totaloccupant = totalfloors * occupant; //on la
  let elevatorNumber = Math.ceil(totaloccupant / 1000);   //on la
  let colonne = Math.ceil(totalfloors / 20);  //on la
  let elevatorPerColonne = Math.ceil(elevatorNumber / colonne);  //on la
  let totalelevator = Math.floor(elevatorPerColonne * colonne); // on la
  console.log(colonne)
  console.log(elevatorPerColonne)



  document.getElementById("resultocc").innerHTML = totaloccupant;
  document.getElementById("result3").innerHTML = totalelevator;
  $(radiochoice1).show();


  if ($('#option-1-3').prop('checked')) {
      document.getElementById("price3").innerHTML = parseFloat(totalelevator * 7565).toFixed(2);
      document.getElementById("fees3").innerHTML = parseFloat(totalelevator * 7565 / 100 * 10).toFixed(2);
      document.getElementById("totalPrice3").innerHTML = parseFloat(totalelevator * 7565 * 1.10).toFixed(2);
      $(priceCorporate).show();
  } if ($('#option-2-3').prop('checked')) {
      document.getElementById("price3").innerHTML = parseFloat(totalelevator * 12345).toFixed(2);
      document.getElementById("fees3").innerHTML = parseFloat(totalelevator * 12345 / 100 * 13).toFixed(2);
      document.getElementById("totalPrice3").innerHTML = parseFloat(totalelevator * 12345 * 1.13).toFixed(2);
      $(priceCorporate).show();
  } if ($('#option-3-3').prop('checked')) {
      document.getElementById("price3").innerHTML = parseFloat(totalelevator * 15400).toFixed(2);
      document.getElementById("fees3").innerHTML = parseFloat(totalelevator * 15400 / 100 * 16).toFixed(2);
      document.getElementById("totalPrice3").innerHTML = parseFloat(totalelevator * 15400 * 1.16).toFixed(2);
      $(priceCorporate).show();
  }

  $(radiochoice1).show();
  if (document.getElementById('floors3').value.length == 0) {
      hidecorporate();
  }
  if (document.getElementById('occupant').value.length == 0) {
      hidecorporate();
  }
  if (document.getElementById('basements').value.length == 0) {
      hidecorporate();
  }
}
//Hide Hybrid Price and button
function hidehybrid() {
  document.getElementById('option-1-4').checked = false;
  document.getElementById('option-2-4').checked = false;
  document.getElementById('option-3-4').checked = false;
  $(radiochoice2).hide();
  $(priceHybrid).hide();
}


function hybridfunc() {
  let floors = document.getElementById("floors4").value;
  let occupant = document.getElementById("occupant4").value;
  let basement = document.getElementById("basements4").value;
  let totalfloors = +floors + +basement;
  let totaloccupant = totalfloors * occupant;
  let elevatorNumber = Math.ceil(totaloccupant / 1000);
  let colonne = Math.ceil(totalfloors / 20);
  let elevatorPerColonne = Math.ceil(elevatorNumber / colonne);
  let totalelevator = Math.floor(elevatorPerColonne * colonne);
  document.getElementById("resultocc2").innerHTML = totaloccupant;
  document.getElementById('result4').innerHTML = totalelevator;

  $(radiochoice2).show();

  if (document.getElementById('floors4').value.length == 0) {
      hidehybrid();
  }
  if (document.getElementById('occupant4').value.length == 0) {
      hidehybrid();
  }
  if (document.getElementById('basements4').value.length == 0) {
      hidehybrid();
  }


  if ($('#option-1-4').prop('checked')) {
      document.getElementById("price4").innerHTML = parseFloat(totalelevator * 7565).toFixed(2);
      document.getElementById("fees4").innerHTML = parseFloat(totalelevator * 7565 / 100 * 10).toFixed(2);
      document.getElementById("totalPrice4").innerHTML = parseFloat(totalelevator * 7565 * 1.10).toFixed(2);
      $(priceHybrid).show();
  } if ($('#option-2-4').prop('checked')) {
      document.getElementById("price4").innerHTML = parseFloat(totalelevator * 12345).toFixed(2);
      document.getElementById("fees4").innerHTML = parseFloat(totalelevator * 12345 / 100 * 13).toFixed(2);
      document.getElementById("totalPrice4").innerHTML = parseFloat(totalelevator * 12345 * 1.13).toFixed(2);
      $(priceHybrid).show();
  } if ($('#option-3-4').prop('checked')) {
      document.getElementById("price4").innerHTML = parseFloat(totalelevator * 15400).toFixed(2);
      document.getElementById("fees4").innerHTML = parseFloat(totalelevator * 15400 / 100 * 16).toFixed(2);
      document.getElementById("totalPrice4").innerHTML = parseFloat(totalelevator * 15400 * 1.16).toFixed(2);
      $(priceHybrid).show();
  }



}




