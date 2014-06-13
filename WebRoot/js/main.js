//global data
var textlist = [];
var listlength = 0;
var textonedit = {};

$(document).ready(function(){
	
	//event binder
	$("#add").click(addtext);
	$("#save").click(savetext);
	$("#logout").click(logout);
	
	//key event
	$(document).keydown(function(e) { 
		if (e.ctrlKey && e.which == 83) {
			savetext();
			return false;
		}		
	}) 
	
	//initialize
	setTextOnedit();
	
	function updateTextnav(){
		var func = function(data){
			data = JSON.parse(data);
			data = data.data;
			textlist = data;
			listlength = data.length;

			$('#textnavbox').empty();
			for(var i=0;i<data.length;i++){
				var text = data[i];
				var html = 
				'<div class="textitem" style="float:left;" id="'+ text.id +'">' +
					'<div class="textcontent">' + text.content.replace(/\n/g,'<br/>') + '</div>' +
					'<div class="textname"><span class="namefield">' + text.name + '</span></div>'+
				'</div>';
				$('#textnavbox').append(html);
				var textobj = $("#"+text.id);
				textobj.data("text", text);
				textobj.children('.textcontent').click(edittext);
				textobj.find('.namefield').click(editname);
			}
			if(textonedit != {}) {
				$('#'+textonedit.id).children('.textcontent').addClass('textselected');
			}
		}
		Text.getTextsByAccountId(accountid,func);
	}
	
	function addtext(){
		var name = 'text' + listlength;
		var func = function(data){
			updateTextnav();
		}
		var text = {
			accountId:accountid,
			content:'',
			name:name
		}
		Text.saveText(text,func);
	}
	
	function edittext(){
		$('.textselected').removeClass('textselected');
		$(this).addClass('textselected');
		textonedit = $(this).parent().data("text");
		$('#editarea').val(textonedit.content);
		$('#textnametop').text(textonedit.name);
	}
	
	function editname(){
		var name = $(this).text();
		var thtml = '<input class="input_name" maxlength=24></input>';
		var obj = $(this).parent();
		var textdata = $(this).parent().parent().data("text");
		
		$(this).parent().html(thtml);
		$(".input_name").val(name).focus().select();
		
		var func = function(){
			var newname = $(".input_name").val();
			if(newname == ""){
				newname = name;	
			}
			textdata.name = newname;
			Text.updateText(textdata,function(){
				if(textdata.id == textonedit.id){
					textonedit.name = newname;
					$("#textnametop").text(newname);
				}
				updateTextnav()
			});
		}
		$(".input_name").blur(func);
		
		$(".input_name").keydown(function(e) { 
			if (e.which == 13) {
				$(".input_name").blur();
			}		
		}) 
	}
	
	function savetext() {
		var content = $("#editarea").val();
		textonedit.content = content;
		var func = function(data){
			if(data == true){
				$('#message').show();
				$('#message').fadeOut(1500);
				updateTextnav();
			}
		}
		Text.updateText(textonedit,func);
	}
	
	function logout() {
		var func = function(data) {
			if(data === true) {
				setCookie(LOGINCOOKIE,"",0);
				window.location.href = "index.jsp";
			}
		}
		Account.logout(func);
	}
	
	function setTextOnedit() {
		var func = function(data) {
			if(data == 'noresult') {
				var name = 'text0';
				var func1 = function(data1){
					textonedit = JSON.parse(data1);	
					$('#editarea').val(textonedit.content);
					$('#textnametop').text(textonedit.name);
					updateTextnav();
				}
				var text = {
					accountId:accountid,
					content:'',
					name:name
				}
				Text.saveText(text,func1);
			} else {
				textonedit = JSON.parse(data);	
				$('#editarea').val(textonedit.content);
				$('#textnametop').text(textonedit.name);
				updateTextnav();
			}
		}
		Text.getTextOneditByAccountId(accountid,func);
	}
});