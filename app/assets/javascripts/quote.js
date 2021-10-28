setInterval(continuousActions, 50);

const standardPrice = 7565;
const premiumPrice = 12345;
const exceliumPrice = 15400;
const standardFee = 0.1;
const premiumFee = 0.13;
const exceliumFee = 0.16;

let [appartments, averageDoorsPerFloor, basements, Elevators, Columns, elevatorsPerColumn, Fee, floors, installationFee, Occupants, occupantsPerFloorNum, pricePerElevator, totalElevators, totalPrice, totalPriceNoFee] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

let typeSelected;
let standardCheck;
let premiumCheck;
let exceliumCheck;

function continuousActions() {
  let myList = document.getElementById("building-type");
  typeSelected = myList.options[myList.selectedIndex].text;
  hide();

  standardCheck = document.getElementById("standard").checked;
  premiumCheck = document.getElementById("premium").checked;
  exceliumCheck = document.getElementById("excelium").checked;

  if (standardCheck == true || premiumCheck == true || exceliumCheck == true) {
    let showEstimates = document.getElementById("Estimates");
    showEstimates.style.display = "block";
  } else if (
    standardCheck == false &&
    premiumCheck == false &&
    exceliumCheck == false
  ) {
    let showEstimates = document.getElementById("Estimates");
    showEstimates.style.display = "none";
  }

  if (standardCheck == true) {
    pricePerElevator = standardPrice;
    installationFee = standardFee;
  } else if (premiumCheck == true) {
    pricePerElevator = premiumPrice;
    installationFee = premiumFee;
  } else if (exceliumCheck == true) {
    pricePerElevator = exceliumPrice;
    installationFee = exceliumFee;
  }
  showResults();
  return (typeSelected, standardCheck, premiumCheck, exceliumCheck, totalElevators, pricePerElevator, installationFee);
}

//call by continuousActions() interval 50ms
function hide() {
  let floorBasements = document.getElementById("floor-basement");
  let companiesShow = document.getElementById("companiesShow");
  let parkingSpots = document.getElementById("parkingSpots");
  let buildingType1 = document.getElementById("residentialShow");
  let buildingType2 = document.getElementById("commercialShow");
  let buildingType3 = document.getElementById("corporateShow");
  let occupantsPerFloor = document.getElementById("occupantsPerFloor");
  let activityHours = document.getElementById("activityHours");

  floorBasements.style.display = "none";
  companiesShow.style.display ="none";
  parkingSpots.style.display = "none";
  buildingType1.style.display = "none";
  buildingType2.style.display = "none";
  buildingType3.style.display = "none";
  occupantsPerFloor.style.display = "none";
  activityHours.style.display = "none";

  if (typeSelected == "Residential") {
    floorBasements.style.display = "block";
    buildingType1.style.display = "block";
  } else if (typeSelected == "Commercial") {
    floorBasements.style.display = "block";
    companiesShow.style.display = "block";
    parkingSpots.style.display = "block";
    buildingType2.style.display = "block";
  } else if (typeSelected == "Corporate") {
    floorBasements.style.display = "block";
    parkingSpots.style.display = "block";
    buildingType3.style.display = "block";
    occupantsPerFloor.style.display = "block";
  } else if (typeSelected == "Hybrid") {
    floorBasements.style.display = "block";
    companiesShow.style.display = "block";
    parkingSpots.style.display = "block";
    occupantsPerFloor.style.display = "block";
    activityHours.style.display = "block";
  } else if (typeSelected == "----Selected----") {
  }
}

//oninput beginning of the form
function calculateAll(typeSelected) {
  basements = parseInt(document.getElementById("number-of-basements").value);
  floors = parseInt(document.getElementById("number-of-floors").value);

  if (typeSelected == "Residential") {
    appartments = document.getElementById("number-of-apartments").value;
    averageDoorsPerFloor = Math.ceil(appartments / floors);
    elevatorsPerColumn = Math.ceil(averageDoorsPerFloor / 6);
    Columns = Math.ceil(floors / 20);
    totalElevators = Columns * elevatorsPerColumn;
  } else if (typeSelected == "Commercial") {
    totalElevators = document.getElementById("number-of-elevators").value;
  } else if (typeSelected == "Corporate" || "Hybrid") {
    occupantsPerFloorNum = parseInt(document.getElementById("maximum-occupancy").value);
    Occupants = occupantsPerFloorNum * (floors + basements);
    Elevators = Math.trunc(Occupants / 1000);
    Columns = Math.ceil((floors + basements) / 20);
    elevatorsPerColumn = Math.ceil(Elevators / Columns);
    totalElevators = elevatorsPerColumn * Columns;
  }
}

const formatter = new Intl.NumberFormat('en', {
  notation: 'standard',
  minimumFractionDigits: 2
});


//call by continuousActions interval 50ms
function showResults() {
  document.getElementById("elevator-amount").value = totalElevators;
  document.getElementById("elevator-unit-price").value = formatter.format(pricePerElevator) + '$';
  totalPriceNoFee = totalElevators * pricePerElevator;
  document.getElementById("elevator-total-price").value = formatter.format(totalPriceNoFee) + '$';
  Fee = installationFee * totalPriceNoFee;
  document.getElementById("installation-fees").value = formatter.format(Fee) + '$';
  totalPrice = totalPriceNoFee + Fee;
  document.getElementById("final-price").value = formatter.format(totalPrice) + '$';

  const arrayNumbers = [
    totalElevators,
    pricePerElevator,
    totalPriceNoFee,
    Fee,
    totalPrice,
  ];

  for (let i = 0; i < arrayNumbers.length; i++) {
    if (totalElevators > 0) {
      let showRadio = document.getElementById("radio-buttons");
      showRadio.style.display = "block";
    } else {
      let showRadio = document.getElementById("radio-buttons");
      showRadio.style.display = "none";
    }
  }
}

function valuesReset() {
  document.getElementById("standard").checked = false;
  document.getElementById("premium").checked = false;
  document.getElementById("excelium").checked = false;

  document.getElementById("number-of-floors").value = "";
  document.getElementById("number-of-basements").value = "";
  document.getElementById("number-of-apartments").value = "";
  document.getElementById("number-of-companies").value = "";
  document.getElementById("number-of-parking-spots").value = "";
  document.getElementById("number-of-elevators").value = "";
  document.getElementById("number-of-corporations").value = "";
  document.getElementById("maximum-occupancy").value = "";
  document.getElementById("business-hours").value = "";
  [
    appartments,
    averageDoorsPerFloor,
    basements,
    Elevators,
    Columns,
    elevatorsPerColumn,
    Fee,
    floors,
    installationFee,
    Occupants,
    occupantsPerFloorNum,
    pricePerElevator,
    totalElevators,
    totalPrice,
    totalPriceNoFee,
  ] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  return (
    appartments,
    averageDoorsPerFloor,
    basements,
    Elevators,
    Columns,
    elevatorsPerColumn,
    Fee,
    floors,
    installationFee,
    Occupants,
    occupantsPerFloorNum,
    pricePerElevator,
    totalElevators,
    totalPrice,
    totalPriceNoFee
  );
}