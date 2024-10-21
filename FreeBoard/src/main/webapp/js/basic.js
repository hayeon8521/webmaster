/**
 * basic.js
 */
console.log("basic.js")

let name = "홍길동";	//string
let age = 20;	//number
let obj = {name: "홍길동"
			,age: 20
			,showInfo: function(){
				return this.name + " - " + this.age;
			}}
			
console.log(obj);

console.log(obj.name);
console.log(obj['age']);
console.log(obj.showInfo());


let data = [obj]
data.push({name: "박민수", age: 22})
data.push({name: "송민혁", age: 25})
makeList();
//DOM data배열에 있는 정보를 출력.
function makeList(){
	document.querySelector('#show table:nth-of-type(2)').className = 'table';
	
	for(let i=0; i<data.length; i++){
		//tr생성.
		let tr = document.createElement('tr');
		//td생성.
		let td = document.createElement('td');
		td.innerHTML = data[i].name;
		tr.appendChild(td);
		td = document.createElement('td');
		td.innerHTML = data[i].age;
		tr.appendChild(td);
		
		document.querySelector('#show table:nth-of-type(2) tbody').appendChild(tr);
	}
}

//DOM
// <li></li>
let li = document.createElement("li");
li.innerText = 'Cherry';

let ul = document.querySelector('#show ul');	//css의 선택자
ul.appendChild(li);

//console.log(ul);

document.querySelectorAll('#show ul li')	// [li, li, li]
	.forEach(function(fruit){
		fruit.style.color='red';
		fruit.addEventListener('click', function(e){
			fruit.remove();
		});
		console.log(fruit.innerHTML);
	});
	

//tr>th+td를 생성 appendchild()실행
let tr = document.createElement("tr");


let td = document.createElement("th");
td.innerText = '이름';
tr.appendChild(td);

td = document.createElement("td");
td.innerText = name;
tr.appendChild(td);

document.querySelector('#show table tbody').appendChild(tr);