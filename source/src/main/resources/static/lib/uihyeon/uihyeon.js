/**
 * js 관련
 */



/**
 * vue 관련
 */



/**
 * format 관련
 */


/**
 * 캡슐화
 */


var uihyeon = {};

(function(){

    var tempData = function (){
        this.sendGet = function( url , data , callback, err){
            console.log('성공');
        }
        this.sendPost = function( url , data , callback, err){
            console.log('sendpost')
        }
        this.summit = function( url , data , callback, err){
            console.log('성공');
        }
    };


    var tempMessage= function (){
        this.alert = function (){
            alert('tt')
        }
    }


    var tempUh = function (){
        this.data = new tempData();
        this.message = new tempMessage();
    }


    console.log('load');

    uihyeon = new tempUh();

})();


