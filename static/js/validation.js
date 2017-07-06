/**
 * Created by Administrator on 2017/7/4.
 */


function update(email) {
    var obj={};
    obj.email=email;
    if(email!==undefined){
         $.ajax({
        type: "POST",
        data: {email:email},
        url: "http://127.0.0.1:8000/forget/",
        success: function(ret){console.log("success");},
        error: function(ret){console.log("error");}
    });
    }else{
        console.log("null")
    }
    console.log(email);

}