
function whichRadioButton() {
  var selectedValue = document.getElementById("quote_building_type").value;
  if (selectedValue == "residential") {
    residential();

  }
  else if (selectedValue == "commercial") {
    commercial();
  }
  else if (selectedValue == "corporateHybrid") {
    corporateHybrid1();
  }
}


function getSelectValue() {
  var residential = document.getElementById("residential");
  var selectedValue = document.getElementById("quote_building_type").value;
  var commercial = document.getElementById("commercial");
  var corporateHybrid = document.getElementById("corporateHybrid");



  if (selectedValue === 'select') {
    reset();
    $(residential).hide();
    $(commercial).hide();
    $(corporateHybrid).hide();
    $(radio_button).hide();
    $(floorBasement).hide();
  }

  if (selectedValue === 'residential') {
      reset();
      $(residential).show();
      $(commercial).hide();
      $(corporateHybrid).hide();
      $(radio_button).show();
      $(floorBasement).show();
      
  };
  if (selectedValue === 'commercial') {
      reset();
      $(commercial).show();
      $(residential).hide();
      $(corporateHybrid).hide();
      $(radio_button).show();
      $(floorBasement).show();
  };

  if (selectedValue == 'corporateHybrid') {
      reset();  
      $(corporateHybrid).show();
      $(residential).hide();
      $(commercial).hide();
      $(radio_button).show();
      $(floorBasement).show();
      document.getElementById('quote_business').value = "";
      document.getElementById('quote_parking').value = "";
  };
  
}


function reset() {
  document.getElementById('quote_plan_standard').checked = false;
  document.getElementById('quote_plan_premium').checked = false;
  document.getElementById('quote_plan_excelium').checked = false;
  document.getElementById('quote_floor').value = "";
  document.getElementById('quote_basement').value = "";
  document.getElementById('quote_appartement').value = "";
  document.getElementById('quote_cages').value = "";
  // document.getElementById('quote_business').value = "";
  // document.getElementById('quote_parking').value = "";
  document.getElementById('quote_occupant').value = "";
  document.getElementById('price').value = "";
  document.getElementById('totalPrice').value = "";
  document.getElementById('cageNeeded').value = "";
  document.getElementById('elevatorNeeded').value = "";
  $(result).hide();
}


function residential() {

  let floors = document.getElementById('quote_floor').value;
  let appartement = document.getElementById('quote_appartement').value;
  let appDivFloors = appartement / floors;
  let elevator = appDivFloors / 6;
  let elevatortotal = Math.ceil(elevator);
  let ifmorethan = Math.ceil((floors-1) / 20);
  let colonne = 1 + ifmorethan;

  const formatter = new Intl.NumberFormat('en', {
    notation: 'standard',
    minimumFractionDigits: 2
  });

  let totalElevatorNeeded = elevatortotal * ifmorethan;
  document.getElementById('elevatorNeeded').innerHTML = totalElevatorNeeded;
  document.getElementById('quote_elevatorNeeded').value = totalElevatorNeeded;


        if ($('#quote_plan_standard').prop('checked')) {
          document.getElementById("price").innerHTML = formatter.format(elevatortotal* ifmorethan * 7565);
          document.getElementById("fees").innerHTML = formatter.format(elevatortotal * ifmorethan * 7565 / 100 * 10);
          document.getElementById("totalPrice").innerHTML = formatter.format(elevatortotal * ifmorethan * 7565 * 1.10);
          document.getElementById('cageNeeded').innerHTML = "7,565.00";
          document.getElementById("quote_price").value = parseFloat(elevatortotal* ifmorethan * 7565).toFixed(2);
          document.getElementById("quote_fees").value = parseFloat(elevatortotal * ifmorethan * 7565 / 100 * 10).toFixed(2);
          document.getElementById("quote_totalPrice").value = parseFloat(elevatortotal * ifmorethan * 7565 * 1.10).toFixed(2);
          $('#result').show();
      } if ($('#quote_plan_premium').prop('checked')) {
          document.getElementById("price").innerHTML = formatter.format(elevatortotal * ifmorethan * 12345);
          document.getElementById("fees").innerHTML = formatter.format(elevatortotal * ifmorethan * 12345 / 100 * 13);
          document.getElementById("totalPrice").innerHTML = formatter.format(elevatortotal * ifmorethan * 12345 * 1.13);
          document.getElementById('cageNeeded').innerHTML = "12,345.00";
          document.getElementById("quote_price").value = parseFloat(elevatortotal * ifmorethan * 12345).toFixed(2);
          document.getElementById("quote_fees").value = parseFloat(elevatortotal * ifmorethan * 12345 / 100 * 13).toFixed(2);
          document.getElementById("quote_totalPrice").value = parseFloat(elevatortotal * ifmorethan * 12345 * 1.13).toFixed(2);
          $('#result').show();
      } if ($('#quote_plan_excelium').prop('checked')) {
          document.getElementById("price").innerHTML = formatter.format(elevatortotal * ifmorethan * 15400);
          document.getElementById("fees").innerHTML = formatter.format(elevatortotal * ifmorethan * 15400 / 100 * 16);
          document.getElementById("totalPrice").innerHTML = formatter.format(elevatortotal * ifmorethan * 15400 * 1.16);
          document.getElementById("quote_price").value = parseFloat(elevatortotal * ifmorethan * 15400).toFixed(2);
          document.getElementById("quote_fees").value = parseFloat(elevatortotal * ifmorethan * 15400 / 100 * 16).toFixed(2);
          document.getElementById("quote_totalPrice").value = parseFloat(elevatortotal * ifmorethan * 15400 * 1.16).toFixed(2);
          document.getElementById('cageNeeded').innerHTML = "15,400.00";

          $('#result').show();
      }

}

function commercial() {
  let cage = document.getElementById('quote_cages').value;
  document.getElementById('elevatorNeeded').innerHTML = cage
  document.getElementById('quote_elevatorNeeded').value = cage;

  const formatter = new Intl.NumberFormat('en', {
    notation: 'standard',
    minimumFractionDigits: 2
  });

  if ($('#quote_plan_standard').prop('checked')) {
      document.getElementById("price").innerHTML = formatter.format(cage * 7565);
      document.getElementById("fees").innerHTML = formatter.format(cage * 7565 / 100 * 10);
      document.getElementById("totalPrice").innerHTML = formatter.format(cage * 7565 * 1.10);
      document.getElementById('cageNeeded').innerHTML = "7,565.00";
      document.getElementById("quote_price").value = parseFloat(cage * 7565).toFixed(2);
      document.getElementById("quote_fees").value = parseFloat(cage * 7565 / 100 * 10).toFixed(2);
      document.getElementById("quote_totalPrice").value = parseFloat(cage * 7565 * 1.10).toFixed(2);
      $('#result').show();
    } if ($('#quote_plan_premium').prop('checked')) {
      document.getElementById("price").innerHTML = formatter.format(cage * 12345);
      document.getElementById("fees").innerHTML = formatter.format(cage * 12345 / 100 * 13);
      document.getElementById("totalPrice").innerHTML = formatter.format(cage * 12345 * 1.13);
      document.getElementById('cageNeeded').innerHTML = "12,345.00";
      document.getElementById("quote_price").value = parseFloat(cage * 12345).toFixed(2);
      document.getElementById("quote_fees").value = parseFloat(cage * 12345 / 100 * 13).toFixed(2);
      document.getElementById("quote_totalPrice").value = parseFloat(cage * 12345 * 1.13).toFixed(2);
      $('#result').show();
    } if ($('#quote_plan_excelium').prop('checked')) {
      document.getElementById("price").innerHTML = formatter.format(cage * 15400);
      document.getElementById("fees").innerHTML = formatter.format(cage * 15400 / 100 * 16);
      document.getElementById("totalPrice").innerHTML = formatter.format(cage * 15400 * 1.16);
      document.getElementById('cageNeeded').innerHTML = "15,400.00";
      document.getElementById("quote_price").value = parseFloat(cage * 15400).toFixed(2);
      document.getElementById("quote_fees").value = parseFloat(cage * 15400 / 100 * 16).toFixed(2);
      document.getElementById("quote_totalPrice").value = parseFloat(cage * 15400 * 1.16).toFixed(2);
      $('#result').show();
  }
}
//Hide Hybrid and corporate Price and button
function hidehybrid() {
  document.getElementById('option-1-4').checked = false;
  document.getElementById('option-2-4').checked = false;
  document.getElementById('option-3-4').checked = false;
  $(radiochoice2).hide();
  $(priceHybrid).hide();
}


function corporateHybrid1() {
  let floors = document.getElementById('quote_floor').value;
  let occupant = document.getElementById("quote_occupant").value;
  let basement = document.getElementById("quote_basement").value;
  let totalfloors = +floors + +basement;
  let totaloccupant = totalfloors * occupant;
  let elevatorNumber = Math.ceil(totaloccupant / 1000);
  let colonne = Math.ceil(totalfloors / 20);
  let elevatorPerColonne = Math.ceil(elevatorNumber / colonne);
  let totalelevator = Math.floor(elevatorPerColonne * colonne);
  document.getElementById('elevatorNeeded').innerHTML = totalelevator;
  document.getElementById('quote_elevatorNeeded').value = totalelevator;
  console.log("number of floor" , floors)
  
  const formatter = new Intl.NumberFormat('en', {
    notation: 'standard',
    minimumFractionDigits: 2
  });


  if ($('#quote_plan_standard').prop('checked')) {
      document.getElementById("price").innerHTML = formatter.format(totalelevator * 7565);
      document.getElementById("fees").innerHTML = formatter.format(totalelevator * 7565 / 100 * 10);
      document.getElementById("totalPrice").innerHTML = formatter.format(totalelevator * 7565 * 1.10);
      document.getElementById("quote_price").value = parseFloat(totalelevator * 7565).toFixed(2);
      document.getElementById("quote_fees").value = parseFloat(totalelevator * 7565 / 100 * 10).toFixed(2);
      document.getElementById("quote_totalPrice").value = parseFloat(totalelevator * 7565 * 1.10).toFixed(2);
      document.getElementById('cageNeeded').innerHTML = "7,565.00";
      $('#result').show();
    } if ($('#quote_plan_premium').prop('checked')) {
      document.getElementById("price").innerHTML = formatter.format(totalelevator * 12345);
      document.getElementById("fees").innerHTML = formatter.format(totalelevator * 12345 / 100 * 13)(2);
      document.getElementById("totalPrice").innerHTML = formatter.format(totalelevator * 12345 * 1.13)(2);
      document.getElementById("quote_price").value = parseFloat(totalelevator * 12345).toFixed(2);
      document.getElementById("quote_fees").value = parseFloat(totalelevator * 12345 / 100 * 13).toFixed(2);
      document.getElementById("quote_totalPrice").value = parseFloat(totalelevator * 12345 * 1.13).toFixed(2);
      document.getElementById('cageNeeded').innerHTML = "12,345.00";
      $('#result').show();
    } if ($('#quote_plan_excelium').prop('checked')) {
      document.getElementById("price").innerHTML = formatter.format(totalelevator * 15400);
      document.getElementById("fees").innerHTML = formatter.format(totalelevator * 15400 / 100 * 16);
      document.getElementById("totalPrice").innerHTML = formatter.format(totalelevator * 15400 * 1.16);
      document.getElementById("quote_price").value = parseFloat(totalelevator * 15400).toFixed(2);
      document.getElementById("quote_fees").value = parseFloat(totalelevator * 15400 / 100 * 16).toFixed(2);
      document.getElementById("quote_totalPrice").value = parseFloat(totalelevator * 15400 * 1.16).toFixed(2);
      document.getElementById('cageNeeded').innerHTML = "15,400.00";
      $('#result').show();

  }



}




