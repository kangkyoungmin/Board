	today=new Date();
    var week=["일","월","화","수","목","금","토"];
    var dayOfweek;
    var check=false;
    var yy,mm,dd,r_mm,r_dd;
    var before_date;
    function reset(){
    	yy = today.getFullYear();
        mm = today.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm; //월 변경  +1 하는 이유는 자바스크립트에서 0이 1월이라 
        dd = today.getDate(); dd = (dd < 10) ? '0' + dd : dd;//10일 이전이면 숫자 자릿수 맞추기 위함
        dayOfweek=week[new Date(today).getDay()];
        before_date=String(yy)+String(mm)+String(dd);
        document.getElementById("currentdate").innerHTML=yy+'.'+mm+'.'+dd+'('+dayOfweek+')';
		post_to_url("Schedule.jsp",{'year':today.getFullYear(),'month':today.getMonth(),'day':today.getDate()});
    }
    if(check==false) reset();
    

    function dateAddDel(beforeDate, addNumber, type) {
    	
        if (type == "d") {    //일
        	before_date = new Date(yy, mm - 1, dd + addNumber);
        }
        else if (type == "m") {   //월
        	before_date = new Date(yy, mm - 1, dd + (addNumber * 31));
        }
        else if (type == "y") {   //년
        	before_date = new Date(yy + addNumber, mm - 1, dd);
        }
        dayOfweek=week[new Date(before_date).getDay()];

        
        yy = before_date.getFullYear();
        mm = before_date.getMonth() + 1; r_mm = (mm < 10) ? '0' + mm : mm; //월 변경  +1 하는 이유는 자바스크립트에서 0이 1월이라 
        dd = before_date.getDate(); r_dd = (dd < 10) ? '0' + dd : dd;//10일 이전이면 숫자 자릿수 맞추기 위함
        
        return '' + yy + '.' +  r_mm  + '.' + r_dd+"("+dayOfweek+")";
    }
        
    
    function left()
    {
    	check=true;
    	document.getElementById("currentdate").innerHTML=dateAddDel(before_date,-1,'d');
		post_to_url("Schedule.jsp",{'year':before_date.getFullYear(),'month':before_date.getMonth(),'day':before_date.getDate()});
    }
    
    function right()
    {
    	check=true;
    	document.getElementById("currentdate").innerHTML=dateAddDel(before_date,1,'d');
		post_to_url("Schedule.jsp",{'year':before_date.getFullYear(),'month':before_date.getMonth(),'day':before_date.getDate()});

    }