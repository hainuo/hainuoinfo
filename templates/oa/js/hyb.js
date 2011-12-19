var a=$("input#dongtiNo");
var b=$("input#canjiNo");
var c=$("input#number");
var d=$("input#jingzhong");
var e=$("input#jingzhong1");
var p=$('input#danjia');
a.change(function(){
	b.val(parseInt(b.val(),10)+0);
	a.val(parseInt(a.val(),10)+0);
	c.val(parseInt(a.val(),10)+parseInt(b.val(),10)+0);
	countJunzhong();
	});
b.change(function(){
	b.val(parseInt(b.val(),10)+0);
	a.val(parseInt(a.val(),10)+0);
	c.val(parseInt(a.val(),10)+parseInt(b.val(),10)+0);
	countJunzhong();
	});
d.change(function(){
	d.val(parseInt(d.val(),10)+0);
	p.val((parseFloat(p.val())+0).toFixed(2));
	e.val(parseInt(d.val(),10)+0);
	countChucheng();
	countJine();
	countJunzhong();
	})
p.change(function()
{
	d.val(parseInt(d.val(),10)+0);
	p.val((parseFloat(p.val())+0).toFixed(2));
	countJine();
})
$('input#dongti').change(function(){countChucheng();});
$('input#canji').change(function(){countChucheng();});
$('input#canjizhesuan').change(function(){countChucheng();});
function countChucheng()
{
	var f=$('input#chucheng');
	var g=parseInt($('input#dongti').val(),10)+0;
	var h=parseInt($('input#canji').val(),10)+0;
	var j=parseInt($('input#canjizhesuan').val(),10)+0;
	var k=parseInt($('input#jingzhong').val(),10)+0;
	//f.val(function(){return (g+h/j)/k*100});
	l=(g+h/j)/k*100+0;
	f.val(l.toFixed(2));				
}
function countJine()
{
	var m=$('input#jine');
	var k=parseInt($('input#jingzhong').val(),10)+0;
	var n=(parseFloat($('input#danjia').val())+0).toFixed(2);
	var o=k*n+0
	m.val(parseInt(o,10)+0);
}
function countJunzhong()
{
	var k=parseInt($('input#jingzhong').val(),10)+0;
	var c=parseInt($("input#number").val(),10)+0;
	var q=k/c*2+0;
	$('input#junzhong').val(q.toFixed(2))
}
if(p.val()=='')p.val('0.00');
if($('#beizhu').val()=='')$('#beizhu').val('无任何争议');
a.val(0);
b.val(0);
$('input#choujiNo').val(0);
$('input#canjizhesuan').val(5);