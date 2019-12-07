
const setLocal = (data) =>{	
	const objData = JSON.stringify(data);
	const id = uuidv4()
	localStorage.setItem(id, objData);
}


const getDataFromElement = () => {
	
	const money = document.getElementsByName("money")[0].value;
	const explain = document.getElementsByName("explain")[0].value;
	
	
	let type;
	if (document.getElementById('1').checked) {
		type = document.getElementById('1').value;
		}
	if (document.getElementById('2').checked) {
		type = document.getElementById('2').value;
		}

	
	const date = new Date().toLocaleString()
	
	setLocal({money, type, explain, date})
	window.location.reload();
}

const getLocalStorage = () =>{

	let data = [];
	
	for ( var i = 0, len = localStorage.length; i < len; ++i ) {
		  data.push(JSON.parse(localStorage.getItem( localStorage.key( i ) )));
		}
	
	
	var tbody = document.getElementById('tbody');


	for (var i = 0; i < data.length; i++) {
    var tr = "<tr>";

   
    /* Must not forget the $ sign */
   
    tr += "<td>$ " + data[i].money + "</td>" + "<td>" + (data[i].type == "2" ? "⤴" : "⤵") + "</td> " + "<td>" + data[i].explain + "</td> " + "<td>" + data[i].date.toString() + "</td>" +"</tr>";

    /* We add the table row to the table body */
    tbody.innerHTML += tr;
	}
	
}

const sum = () => {
	
	const data = [];
	let sumRevenue = 0;
	let sumExpenditure = 0;
	for ( var i = 0, len = localStorage.length; i < len; ++i ) {
		  data.push(JSON.parse(localStorage.getItem( localStorage.key( i ) )));
		}
	
	for (var i = 0; i < data.length; i++) {
		
		if(data[i].type === "1")
			sumRevenue += parseInt(data[i].money)
			
		if(data[i].type === "2")
			sumExpenditure += parseInt(data[i].money)	
	}
	
	let balance = sumRevenue - sumExpenditure;
	
	
	var showBalance = document.getElementById('balance');
	showBalance.innerHTML = balance.toString() + " $";
	
	var showRevenue = document.getElementById('revenue');
	showRevenue.innerHTML = sumRevenue.toString() + " $";
	
	var showSpending = document.getElementById('spending');
	showSpending.innerHTML = sumExpenditure.toString() + " $";
	
	
}
