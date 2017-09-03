<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7; IE=9"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> New Document </title>
	
	<!--[if lt IE 9]>	
	<script src="excanvas.js"></script>
<![endif]-->

<script type="text/javascript" src="../../../common/jquery-1.7.2.js"></script>
<script type="text/javascript" src="FormulaEditor.js"></script>
<script type="text/javascript" src="ASCIIMathML.js"></script>
<script src="accessKey.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="FormulaEditor.css">
<link type="text/css" rel="stylesheet" href="FormulaEditorForAll.css">
<script type="text/javascript">

	function FE_Minimized(){
		$('#FE_ico').css('display','block');
		//这里需要加上动态收起效果
		$('#FE_editor').css('display','none');
	}

	function FE_Close(){
		$('#FE_ico').css('display','none');
		$('#FE_editor').css('display','none');
	}

	//sign: 0 数学，1 理化, 2 特殊符号
	function FE_Change_Sign(sign){
		$('#FE_maths_list,#FE_physics_list,#FE_signs_list').hide();
		$('#FE_maths').attr('class','FE_maths');
		$('#FE_physics').attr('class','FE_physics');
		$('#FE_signs').attr('class','FE_signs');
		switch(sign){
			case 0:
				$('#FE_maths_list').css('display','block');
				$('#FE_maths').attr('class','FE_maths hot');
				break;
			case 1:
				$('#FE_physics_list').css('display','block');
				$('#FE_physics').attr('class','FE_physics hot');
				break;
			case 2:
				$('#FE_signs_list').css('display','block');
				$('#FE_signs').attr('class','FE_signs hot');
				break;
		}
	}

	//initSubId: 0 数学，1 理化
	function FE_ico_Click(initSubId){		
		FE_Change_Sign(initSubId);
		$('#FE_ico').css('display','none');
		//这里需要加上动态展开效果和坐标定位
		$('#FE_editor').css('display','block');
	}

	function FE_Clear(){		
		var length = box.FEBox.childNodes.length;
		while(box.FEBox.firstChild !== box.FEBox.lastChild){
			box.FEBox.removeChild(box.FEBox.lastChild);
		}

		var elem = box.FEBox.firstChild;
		elem.innerHTML = '';
		elem.className = elem.getAttribute('clsName');
		box.SetFocus(elem);
	}

    $(function(){
        var textBox = document.getElementById('FEBox');				
		
		//循环页面中所有空调用以下方法，textBox为各个空实例
		box.Init(textBox,1000); //1000为各空的基值，两空间的差数为1000
        //document.getElementById("1001").click();
        textBox.click();
        
        //数学符号
        KeyCode.create(document.getElementById("Fenshu"),str_to_num('(function(){box.Create("Fraction");})();'),'alt+49');            
        KeyCode.create(document.getElementById("Genhao"),str_to_num('(function(){box.Create("Sqrt");})();'),'alt+50');
        KeyCode.create(document.getElementById("Genhaon"),str_to_num('(function(){box.Create("Sqrtn");})();'),'alt+51');
        KeyCode.create(document.getElementById("Youshanbiao"),str_to_num('(function(){box.Create("SignRT");})();'),'alt+52');
        KeyCode.create(document.getElementById("Youxiabiao"),str_to_num('(function(){box.Create("SignRB");})();'),'alt+53');
        KeyCode.create(document.getElementById("Youlianbiao"),str_to_num('(function(){box.Create("SignRTB");})();'),'alt+54');
        KeyCode.create(document.getElementById("Xunhuan"),str_to_num('(function(){box.Create("SignLoop");})();'),'alt+55');
        KeyCode.create(document.getElementById("Pingjunshu"),str_to_num('(function(){box.Create("SignAvg");})();'),'alt+56');
        KeyCode.create(document.getElementById("Xiangliang"),str_to_num('(function(){box.Create("SignVector");})();'),'alt+57');
        KeyCode.create(document.getElementById("Hudu"),str_to_num('(function(){box.Create("SignArc");})();'),'alt+48');
        KeyCode.create(document.getElementById("Limit"),str_to_num('(function(){box.Create("SignLimit");})();'),'alt+112');	//F1
        KeyCode.create(document.getElementById("Sigema"),str_to_num('(function(){box.Create("SignMTB");})();'),'alt+113'); //F2
        KeyCode.create(document.getElementById("Kuohao"),str_to_num('(function(){box.Create("Brackets");})();'),'alt+114');
        KeyCode.create(document.getElementById("Juzhen1"),str_to_num('(function(){box.Create("Matrix12");})();'),'alt+116');
        KeyCode.create(document.getElementById("Juzhen2"),str_to_num('(function(){box.Create("Matrix22");})();'),'alt+118');//F7
        KeyCode.create(document.getElementById("Fangcheng"),str_to_num('(function(){box.Create("Equa");})();'),'alt+119');//F8
        //物理化学符号
        KeyCode.create(document.getElementById("Rou"),str_to_num('(function(){box.Insert("ρ");})();'),'alt+66','alt+66');//+B
        KeyCode.create(document.getElementById("Miu"),str_to_num('(function(){box.Insert("μ");})();'),'alt+71','alt+71');//+G
        KeyCode.create(document.getElementById("Aita"),str_to_num('(function(){box.Insert("η");})();'),'alt+73','alt+73');//+I
        KeyCode.create(document.getElementById("Oumiga"),str_to_num('(function(){box.Insert("ω");})();'),'alt+74','alt+74');//+J
        KeyCode.create(document.getElementById("Yipuxilong"),str_to_num('(function(){box.Insert("ε");})();'),'alt+75','alt+75');//+K
        KeyCode.create(document.getElementById("Deerta"),str_to_num('(function(){box.Insert("Δ");})();'),'alt+78','alt+78');//+N
        KeyCode.create(document.getElementById("Aerfa"),str_to_num('(function(){box.Insert("α");})();'),'alt+81','alt+81');//+Q
        KeyCode.create(document.getElementById("Beita"),str_to_num('(function(){box.Insert("β");})();'),'alt+85','alt+85');//+U
        KeyCode.create(document.getElementById("Gama"),str_to_num('(function(){box.Insert("γ");})();'),'alt+88','alt+88');//+X
        KeyCode.create(document.getElementById("Foai"),str_to_num('(function(){box.Insert("φ");})();'),'alt+89','alt+89');//+Y
        KeyCode.create(document.getElementById("Citongliang"),str_to_num('(function(){box.Insert("Φ");})();'),'alt+9','alt+57+shift');
        KeyCode.create(document.getElementById("Oumo"),str_to_num('(function(){box.Insert("Ω");})();'),'alt+10','alt+48+shift');
        KeyCode.create(document.getElementById("Bochang"),str_to_num('(function(){box.Insert("λ");})();'),'alt+11','alt+112+shift');
        KeyCode.create(document.getElementById("Ai"),str_to_num('(function(){box.Insert("Å");})();'),'alt+12','alt+113+shift');
        KeyCode.create(document.getElementById("banshuaiqi"),str_to_num('(function(){box.Insert("τ");})();'),'alt+13','alt+114+shift');
        KeyCode.create(document.getElementById("Pinglv"),str_to_num('(function(){box.Insert("ν");})();'),'alt+14','alt+116+shift');
      
        
        KeyCode.create(document.getElementById("ZuoshangH"),str_to_num('(function(){box.Create("SignLT");})();'),'alt+120');//F9
        KeyCode.create(document.getElementById("ZuoxiaH"),str_to_num('(function(){box.Create("SignLB");})();'),'alt+121');//F10
        KeyCode.create(document.getElementById("SigeH"),str_to_num('(function(){box.Create("SignLRTB");})();'),'alt+122');//F11
        KeyCode.create(document.getElementById("DingbuH"),str_to_num('(function(){box.Create("SignMT");})();'),'alt+123');//F12
        KeyCode.create(document.getElementById("DingyouxiaH"),str_to_num('(function(){box.Create("SignMTRB");})();'),'alt+1','alt+49+shift');
        KeyCode.create(document.getElementById("Huaxue2"),str_to_num('(function(){box.Create("Chemistry2");})();'),'alt+2','alt+50+shift');
        KeyCode.create(document.getElementById("Huaxue3"),str_to_num('(function(){box.Create("Chemistry3");})();'),'alt+3','alt+51+shift');
        KeyCode.create(document.getElementById("Huaxue4"),str_to_num('(function(){box.Create("Chemistry4");})();'),'alt+4','alt+52+shift');
        KeyCode.create(document.getElementById("FE_Peiping"),str_to_num('(function(){box.Create("Vary");})();'),'alt+5','alt+53+shift');             
                    
        //特殊符号   
        KeyCode.create(document.getElementById("Kexi"),str_to_num('(function(){box.Insert("ξ");})();'),'alt+6','alt+54+shift');
	    KeyCode.create(document.getElementById("Xita"),str_to_num('(function(){box.Insert("θ");})();'),'alt+7','alt+55+shift');
	    KeyCode.create(document.getElementById("Deerta_teX"),str_to_num('(function(){box.Insert("δ");})();'),'alt+8','alt+56+shift');
	    
				
		//设定化学配平是否可见，定义只有内部人员录入可用
		//$('#FE_Peiping').css('visibility','hidden');
    });
	
	function parseMathML(){
		   
        var ml = parser.Analyse(document.getElementById("FEBox"));
        if(ml.replace(/`/g,"") == '') return;
                    
        window.returnValue = ml;
        window.close();
	}
</script>
</head>

<body style="margin:0;">
	<div id="FE_editor" class="FE_editor" style="position: static; border: 1px solid rgb(255, 255, 255); display: block;">
		<div class="FEeditorbg" style="background-image:none;background-color:#ffffff;">
			<dl>
            	<dd><a id="FE_maths" class="FE_maths hot" href="javascript:;" style="border-left:#84b2d7 solid 1px;" onclick="FE_Change_Sign(0);return false;">数学符号</a></dd>
                <dd><a id="FE_physics" class="FE_physics" href="javascript:;" onclick="FE_Change_Sign(1);return false;">物理化学</a></dd>
                <dd><a id="FE_signs" class="FE_signs" href="javascript:;" onclick="FE_Change_Sign(2);return false;">特殊符号</a></dd>
                <dt><span></span></dt>
            </dl>

			<div class="FEeditorBody" style="padding-bottom:10px;">
				<ul style="display: block;" id="FE_maths_list" class="FElist">
					<li><a class="Jiahao" href="javascript:;" title="加号" onclick="box.Insert('+');return false;"></a></li>
					<li><a class="Jianhao" href="javascript:;" title="减号" onclick="box.Insert('-');return false;"></a></li>
					<li><a class="Chenghao" href="javascript:;" title="乘号" onclick="box.Insert('×');return false;"></a></li>
					<li><a class="Chuhao" href="javascript:;" title="除号" onclick="box.Insert('÷');return false;"></a></li>
					<li><a class="Diancheng" href="javascript:;" title="点乘" onclick="box.Insert('·');return false;"></a></li>
					<li><a class="Xiaoyu" href="javascript:;" title="小于" onclick="box.Insert('＜');return false;"></a></li>
					<li><a class="Dayu" href="javascript:;" title="大于" onclick="box.Insert('>');return false;"></a></li>
					<li><a class="Xiaoyudengyu" href="javascript:;" title="小于等于" onclick="box.Insert('≤');return false;"></a></li>
					<li><a class="Dayudengyu" href="javascript:;" title="大于等于" onclick="box.Insert('≥');return false;"></a></li>
					<li><a class="Yuedengyu" href="javascript:;" title="约等于" onclick="box.Insert('≈');return false;"></a></li>
					<li><a class="Budengyu" href="javascript:;" title="不等于" onclick="box.Insert('≠');return false;"></a></li>
					<li><a class="Yuanzhoulv" href="javascript:;" title="圆周率" onclick="box.Insert('π');return false;"></a></li>
					<li><a class="Wuqiongda" href="javascript:;" title="无穷大" onclick="box.Insert('∞');return false;"></a></li>
					<li><a class="Yinwei" href="javascript:;" title="因为" onclick="box.Insert('∵');return false;"></a></li>
					<li><a class="Suoyi" href="javascript:;" title="所以" onclick="box.Insert('∴');return false;"></a></li>
					<li><a class="Tuichu" href="javascript:;" title="推出" onclick="box.Insert('⇒');return false;"></a></li>
					<li><a class="Dengjiayu" href="javascript:;" title="等价于" onclick="box.Insert('⇔');return false;"></a></li>
					<li><a class="Quandengyu" href="javascript:;" title="全等于" onclick="box.Insert('≌');return false;"></a></li>
					<li><a class="Xiangsiyu" href="javascript:;" title="相似于" onclick="box.Insert('∽');return false;"></a></li>
					<li><a class="Pingxing" href="javascript:;" title="平行" onclick="box.Insert('∥');return false;"></a></li>
					<li><a class="Chuizhi" href="javascript:;" title="垂直" onclick="box.Insert('⊥');return false;"></a></li>
					<li><a class="Jiaodu" href="javascript:;" title="角" onclick="box.Insert('∠');return false;"></a></li>
					<li><a class="Sanjiaoxing" href="javascript:;" title="三角形" onclick="box.Insert('△');return false;"></a></li>
					<li><a class="Sibianxing" href="javascript:;" title="平行四边形" onclick="box.Insert('▱');return false;"></a></li>
					<li><a class="Yuan" href="javascript:;" title="圆" onclick="box.Insert('⊙');return false;"></a></li>
					<li><a class="Shuyu" href="javascript:;" title="属于" onclick="box.Insert('∈');return false;"></a></li>
					<li><a class="Bushuyu" href="javascript:;" title="不属于" onclick="box.Insert('∉');return false;"></a></li>
					<li><a class="Kongji" href="javascript:;" title="空集" onclick="box.Insert('∅');return false;"></a></li>
					<li><a class="Baohuanyu" href="javascript:;" title="包含于" onclick="box.Insert('⊂');return false;"></a></li>
					<li><a class="Baohan" href="javascript:;" title="包含" onclick="box.Insert('⊃');return false;"></a></li>
					<li><a class="Bingji" href="javascript:;" title="并集" onclick="box.Insert('∪');return false;"></a></li>
					<li><a class="Jiaoji" href="javascript:;" title="交集" onclick="box.Insert('∩');return false;"></a></li>
					<li><a class="Baohuanyu2" href="javascript:;" title="包含于" onclick="box.Insert('⊆');return false;"></a></li>
					<li><a class="Baohan2" href="javascript:;" title="包含" onclick="box.Insert('⊇');return false;"></a></li>
					<li><a class="Bubaohanyu" href="javascript:;" title="不包含于" onclick="box.Insert('⊄');return false;"></a></li>
					<li><a class="Bubaohan" href="javascript:;" title="不包含" onclick="box.Insert('⊅');return false;"></a></li>
					<li><a class="Bubaohanyu2" href="javascript:;" title="不包含于" onclick="box.Insert('⊈');return false;"></a></li>
					<li><a class="Bubaohan2" href="javascript:;" title="不包含" onclick="box.Insert('⊉');return false;"></a></li>
					<li><a class="Zhenbaohanyu" href="javascript:;" title="真包含于" onclick="box.Insert('⊊');return false;"></a></li>
					<li><a class="Zhenbaohan" href="javascript:;" title="真包含" onclick="box.Insert('⊋');return false;"></a></li>
					<li><a class="Buji" href="javascript:;" title="补集" onclick="box.Insert('∁');return false;"></a></li>
					<li><a class="quandy_sx" href="javescript:;" title="恒等于" onclick="box.Insert('≡');return false;"></a></li>
					<li><a id="Fenshu" class="Fenshu" href="javascript:;" title="分数 ALT+1" onclick="box.Create('Fraction');return false;"></a></li>
					<li><a id="Genhao" class="Genhao" href="javascript:;" title="根号 ALT+2" onclick="box.Create('Sqrt');return false;"></a></li>
					<li><a id="Genhaon" class="Genhaon" href="javascript:;" title="N次根号 ALT+3" onclick="box.Create('Sqrtn');return false;"></a></li>
					<li><a id="Youshanbiao" class="Youshangbiao" href="javascript:;" title="右上标 ALT+4" onclick="box.Create('SignRT');return false;"></a></li>
					<li><a id="Youxiabiao" class="Youxiabiao" href="javascript:;" title="右下标 ALT+5" onclick="box.Create('SignRB');;return false;"></a></li>
					<li><a id="Youlianbiao" class="Youliangbiao" href="javascript:;" title="右标 ALT+6" onclick="box.Create('SignRTB');;return false;"></a></li>
					<li><a id="Xunhuan" class="Xunhuan" href="javascript:;" title="循环 ALT+7" onclick="box.Create('SignLoop');;return false;"></a></li>
					<li><a id="Pingjunshu" class="Pingjunshu" href="javascript:;" title="平均数 ALT+8" onclick="box.Create('SignAvg');;return false;"></a></li>
					<li><a id="Xiangliang" class="Xiangliang" href="javascript:;" title="向量 ALT+9" onclick="box.Create('SignVector');;return false;"></a></li>
					<li><a id="Hudu" class="Hudu" href="javascript:;" title="弧度 ALT+0" onclick="box.Create('SignArc');;return false;"></a></li>
					<li><a id="Limit" class="Limit" href="javascript:;" title="limit ALT+F1" onclick="box.Create('SignLimit');;return false;"></a></li>
					<li><a id="Sigema" class="Sigema" href="javascript:;" title="求和 ALT+F2" onclick="box.Create('SignMTB');;return false;"></a></li>
					<li><a id="Kuohao" class="Kuohao" href="javascript:;" title="长括号 ALT+F3" onclick="box.Create('Brackets');;return false;"></a></li>
					<li><a id="Juzhen1" class="Juzhen1" href="javascript:;" title="1列矩阵 ALT+F5" onclick="box.Create('Matrix12');;return false;"></a></li>
					<li><a id="Juzhen2" class="Juzhen2" href="javascript:;" title="2列矩阵 ALT+F7" onclick="box.Create('Matrix22');;return false;"></a></li>
					<li><a id="Fangcheng" class="Fangchegn" href="javascript:;" title="方程组 ALT+F8" onclick="box.Create('Equa');;return false;"></a></li>
					<li><a class="Qingkong1" href="javascript:;" title="清空" onclick="FE_Clear();return false;"></a></li>
				</ul>

				<ul style="display: none;" id="FE_physics_list" class="FElist">
					<li><a class="Jiahao" href="javascript:;" title="加号" onclick="box.Insert('+');return false;"></a></li>
					<li><a class="Jianhao" href="javascript:;" title="减号" onclick="box.Insert('-');return false;"></a></li>
					<li><a class="Chenghao" href="javascript:;" title="乘号" onclick="box.Insert('×');return false;"></a></li>
					<li><a class="Chuhao" href="javascript:;" title="除号" onclick="box.Insert('÷');return false;"></a></li>
					<li><a class="Diancheng" href="javascript:;" title="点乘" onclick="box.Insert('·');return false;"></a></li>
					<li><a class="Xiaoyu" href="javascript:;" title="小于" onclick="box.Insert('＜');return false;"></a></li>
					<li><a class="Dayu" href="javascript:;" title="大于" onclick="box.Insert('>');return false;"></a></li>
					<li><a class="Xiaoyudengyu" href="javascript:;" title="小于等于" onclick="box.Insert('≤');return false;"></a></li>
					<li><a class="Dayudengyu" href="javascript:;" title="大于等于" onclick="box.Insert('≥');return false;"></a></li>
					<li><a class="Yuedengyu" href="javascript:;" title="约等于" onclick="box.Insert('≈');return false;"></a></li>
					<li><a class="Budengyu" href="javascript:;" title="不等于" onclick="box.Insert('≠');return false;"></a></li>
                    <li><a class="Shishidu" href="javascript:;" title="摄氏度" onclick="box.Insert('℃');return false;"></a></li>
                    <li><a class="Huashidu" href="javascript:;" title="华氏度" onclick="box.Insert('℉');return false;"></a></li>
                    <li><a class="Tantanshuang" href="javascript:;" title="碳碳双键" onclick="box.Insert('＝');return false;"></a></li>
                    <li><a class="Tantansan" href="javascript:;" title="碳碳三键" onclick="box.Insert('≡');return false;"></a></li>
                    <li><a class="Qiti" href="javascript:;" title="气体" onclick="box.Insert('↑');return false;"></a></li>
                    <li><a class="Chendian" href="javascript:;" title="沉淀" onclick="box.Insert('↓');return false;"></a></li>
                    <li><a id="Rou" class="Rou" href="javascript:;" title="希腊字母 ALT+B" onclick="box.Insert('ρ');return false;"></a></li>
                    <li><a id="Miu" class="Miu" href="javascript:;" title="希腊字母 ALT+G" onclick="box.Insert('μ');return false;"></a></li>
                    <li><a id="Aita" class="Aita" href="javascript:;" title="希腊字母 ALT+I" onclick="box.Insert('η');return false;"></a></li>
                    <li><a id="Oumiga" class="Oumiga" href="javascript:;" title="希腊字母 ALT+J" onclick="box.Insert('ω');return false;"></a></li>
                    <li><a id="Yipuxilong" class="Yipuxilong" href="javascript:;" title="希腊字母 ALT+K" onclick="box.Insert('ε');return false;"></a></li>
                    <li><a id="Deerta" class="Deerta" href="javascript:;" title="希腊字母 ALT+N" onclick="box.Insert('Δ');return false;"></a></li>
                    <li><a id="Aerfa" class="Aerfa" href="javascript:;" title="希腊字母 ALT+Q" onclick="box.Insert('α');return false;"></a></li>
                    <li><a id="Beita" class="Beita" href="javascript:;" title="希腊字母 ALT+U" onclick="box.Insert('β');return false;"></a></li>
                    <li><a id="Gama" class="Gama" href="javascript:;" title="希腊字母 ALT+X" onclick="box.Insert('γ');return false;"></a></li>
                    <li><a id="Foai" class="Foai" href="javascript:;" title="希腊字母 ALT+Y" onclick="box.Insert('φ');return false;"></a></li>
                    <li><a id="Oumo" class="Oumo" href="javascript:;" title="欧姆 ALT+SHIFT+0" onclick="box.Insert('Ω');return false;"></a></li>
                    <li><a id="Citongliang" class="Citongliang" href="javascript:;" title="磁通量 ALT+SHIFT+9" onclick="box.Insert('Φ');return false;"></a></li>
                    <li><a id="Bochang" class="Bochang" href="javascript:;" title="波长 ALT+SHIFT+F1" onclick="box.Insert('λ');return false;"></a></li>
                    <li><a id="Ai" class="Ai" href="javascript:;" title="埃 ALT+SHIFT+F2" onclick="box.Insert('Å');return false;"></a></li>
                    <li><a id="banshuaiqi" class="banshuaiqi" href="javascript:;" title="半衰期 ALT+SHIFT+F3" onclick="box.Insert('τ');return false;"></a></li>
                    <li><a id="Pinglv" class="Pinglv" href="javascript:;" title="频率 ALT+SHIFT+F5" onclick="box.Insert('ν');return false;"></a></li>
                    <li><a class="lihua002"></a></li>
                    <li><a class="lihua002"></a></li>
                    <li><a class="lihua003"></a></li>
                    <li><a class="lihua004"></a></li>
                    <li><a class="lihua005"></a></li>
                    <li><a class="lihua006"></a></li>
                    <li><a class="lihua007"></a></li>
                    <li><a class="lihua008"></a></li>
                    <li><a class="lihua009"></a></li>
                    <li><a id="YoushangH" class="YoushangH" href="javascript:;" title="右上标 ALT+4" onclick="box.Create('SignRT');return false;"></a></li>
                    <li><a id="YouxiaH" class="YouxiaH" href="javascript:;" title="右下标 ALT+5" onclick="box.Create('SignRB');return false;"></a></li>
                    <li><a id="YouliangH" class="YouliangH" href="javascript:;" title="右双标 ALT+6" onclick="box.Create('SignRTB');return false;"></a></li>
                    <li><a id="ZuoshangH" class="ZuoshangH" href="javascript:;" title="左上标 ALT+F9" onclick="box.Create('SignLT');return false;"></a></li>
                    <li><a id="ZuoxiaH" class="ZuoxiaH" href="javascript:;" title="左下标 ALT+F10" onclick="box.Create('SignLB');return false;"></a></li>
                    <li><a id="SigeH" class="SigeH" href="javascript:;" title="四角标 ALT+F11" onclick="box.Create('SignLRTB');return false;"></a></li>
                    <li><a id="DingbuH" class="DingbuH" href="javascript:;" title="顶标 ALT+F12" onclick="box.Create('SignMT');return false;"></a></li>
                    <li><a id="DingyouxiaH" class="DingyouxiaH" href="javascript:;" title="顶、右下标 ALT+SHIFT+1" onclick="box.Create('SignMTRB');return false;"></a></li>
                    <li><a id="Huaxue1" class="Huaxue1" href="javascript:;" title="特殊符号" onclick="box.Create('Chemistry1');return false;"></a></li>
                    <li><a id="Huaxue2" class="Huaxue2" href="javascript:;" title="特殊符号 ALT+SHIFT+2" onclick="box.Create('Chemistry2');return false;"></a></li>
                    <li><a id="Huaxue3" class="Huaxue3" href="javascript:;" title="特殊符号 ALT+SHIFT+3" onclick="box.Create('Chemistry3');return false;"></a></li>
                    <li><a id="Huaxue4" class="Huaxue4" href="javascript:;" title="特殊符号 ALT+SHIFT+4" onclick="box.Create('Chemistry4');return false;"></a></li>
                    <li><a id="FE_Peiping" class="Peiping" href="javascript:;" title="化学配平 ALT+SHIFT+5" onclick="box.Create('Vary');return false;"></a></li>
                    <li><a class="huaxue001"></a></li>
                    <li><a class="Qingkong2" href="javascript:;" title="清空" onclick="FE_Clear();return false;"></a></li>
                </ul>

				<ul style="display: none;" id="FE_signs_list" class="FElist">
                	<li><a class="Log" href="javascript:;" title="log" onclick="box.Insert('㏒');return false;"></a></li>
                    <li><a class="Ln" href="javascript:;" title="ln" onclick="box.Insert('㏑');return false;"></a></li>
                    <li><a class="Jifen" href="javascript:;" title="积分" onclick="box.Insert('∫');return false;"></a></li>
                    <li><a class="Dushu" href="javascript:;" title="度" onclick="box.Insert('°');return false;"></a></li>
                    <li><a class="Fenzhong" href="javascript:;" title="分" onclick="box.Insert('′');return false;"></a></li>
                    <li><a class="Miaozhong" href="javascript:;" title="秒" onclick="box.Insert('″');return false;"></a></li>
                    <li><a class="Qianfenbi" href="javascript:;" title="千分号" onclick="box.Insert('‰');return false;"></a></li>
                    <li><a class="Shishidu_te" href="javascript:;" title="摄氏度" onclick="box.Insert('℃');return false;"></a></li>
                    <li><a class="Huashidu_te" href="javascript:;" title="华氏度" onclick="box.Insert('℉');return false;"></a></li>
                    <li><a class="Jiajian" href="javascript:;" title="加减" onclick="box.Insert('±');return false;"></a></li>
                    <li><a class="Jianjia" href="javascript:;" title="减加" onclick="box.Insert('∓');return false;"></a></li>
                    <li><a class="Qie" href="javascript:;" title="且" onclick="box.Insert('∧');return false;"></a></li>
                    <li><a class="Huo" href="javascript:;" title="或" onclick="box.Insert('∨');return false;"></a></li>
                    <li><a class="Shangsheng" href="javascript:;" title="上升" onclick="box.Insert('↗');return false;"></a></li>
                    <li><a class="Xiajiang" href="javascript:;" title="下降" onclick="box.Insert('↘');return false;"></a></li>
                    <li><a class="Budayu" href="javascript:;" title="不大于" onclick="box.Insert('≯');return false;"></a></li>
                    <li><a class="Buxiaoyu" href="javascript:;" title="不小于" onclick="box.Insert('≮');return false;"></a></li>
                    <li><a class="Hengdengyu" href="javascript:;" title="恒等于" onclick="box.Insert('≡');return false;"></a></li>
                    <li><a class="Chengzhengbi" href="javascript:;" title="成正比" onclick="box.Insert('∝');return false;"></a></li>
                    <li><a class="Qiuji" href="javascript:;" title="求积" onclick="box.Insert('∏');return false;"></a></li>
                    <li><a class="Wuqiongxiao" href="javascript:;" title="无穷小 ALT+K" onclick="box.Insert('ε');return false;"></a></li>
                    <li><a id="Kexi" class="Kexi" href="javascript:;" title="希腊字母 ALT+SHIFT+6" onclick="box.Insert('ξ');return false;"></a></li>
                    <li><a class="Miu_te" href="javascript:;" title="希腊字母 ALT+G" onclick="box.Insert('μ');return false;"></a></li>
                    <li><a class="Deerta_te" href="javascript:;" title="希腊字母 ALT+N" onclick="box.Insert('Δ');return false;"></a></li>
                    <li><a class="Aerfa_tr" href="javascript:;" title="希腊字母 ALT+Q" onclick="box.Insert('α');return false;"></a></li>
                    <li><a class="Beita_te" href="javascript:;" title="希腊字母 ALT+U" onclick="box.Insert('β');return false;"></a></li>
                    <li><a class="Gama_te" href="javascript:;" title="希腊字母 ALT+X" onclick="box.Insert('γ');return false;"></a></li>
                    <li><a class="Rou_te" href="javascript:;" title="希腊字母 ALT+B" onclick="box.Insert('ρ');return false;"></a></li>
                    <li><a class="lanbuda_te" href="javascript:;" title="希腊字母 ALT+SHIFT+F1" onclick="box.Insert('λ');return false;"></a></li>
                    <li><a id="Deerta_teX" class="Deerta_teX" href="javascript:;" title="希腊字母 ALT+SHIFT+8" onclick="box.Insert('δ');return false;"></a></li>
                    <li><a class="Oumiga_te" href="javascript:;" title="希腊字母 ALT+J" onclick="box.Insert('ω');return false;"></a></li>
                    <li><a class="Foai_te" href="javascript:;" title="希腊字母 ALT+SHIFT+9" onclick="box.Insert('Φ');return false;"></a></li>
                    <li><a class="Foai_teX" href="javascript:;" title="希腊字母 ALT+Y" onclick="box.Insert('φ');return false;"></a></li>
                    <li><a class="Aita_te" href="javascript:;" title="希腊字母 ALT+I" onclick="box.Insert('η');return false;"></a></li>
                    <li><a id="Xita" class="Xita_te" href="javascript:;" title="希腊字母 ALT+SHIFT+7" onclick="box.Insert('θ');return false;"></a></li>
                    <li><a class="Quan1" href="javascript:;" title="数字序号1" onclick="box.Insert('①');return false;"></a></li>
                    <li><a class="Quan2" href="javascript:;" title="数字序号2" onclick="box.Insert('②');return false;"></a></li>
                    <li><a class="Quan3" href="javascript:;" title="数字序号3" onclick="box.Insert('③');return false;"></a></li>
                    <li><a class="Quan4" href="javascript:;" title="数字序号4" onclick="box.Insert('④');return false;"></a></li>
                    <li><a class="Quan5" href="javascript:;" title="数字序号5" onclick="box.Insert('⑤');return false;"></a></li>
                    <li><a class="Quan6" href="javascript:;" title="数字序号6" onclick="box.Insert('⑥');return false;"></a></li>
                    <li><a class="Quan7" href="javascript:;" title="数字序号7" onclick="box.Insert('⑦');return false;"></a></li>
                    <li><a class="Quan8" href="javascript:;" title="数字序号8" onclick="box.Insert('⑧');return false;"></a></li>
                    <li><a class="Quan9" href="javascript:;" title="数字序号9" onclick="box.Insert('⑨');return false;"></a></li>
                    <li><a class="Quan10" href="javascript:;" title="数字序号10" onclick="box.Insert('⑩');return false;"></a></li>
                    <li><a class="Luoma1" href="javascript:;" title="罗马数字1" onclick="box.Insert('Ⅰ');return false;"></a></li>
                    <li><a class="Luoma2" href="javascript:;" title="罗马数字2" onclick="box.Insert('Ⅱ');return false;"></a></li>
                    <li><a class="Luoma3" href="javascript:;" title="罗马数字3" onclick="box.Insert('Ⅲ');return false;"></a></li>
                    <li><a class="Luoma4" href="javascript:;" title="罗马数字4" onclick="box.Insert('Ⅳ');return false;"></a></li>
                    <li><a class="Luoma5" href="javascript:;" title="罗马数字5" onclick="box.Insert('Ⅴ');return false;"></a></li>
                    <li><a class="Luoma6" href="javascript:;" title="罗马数字6" onclick="box.Insert('Ⅵ');return false;"></a></li>
                    <li><a class="Luoma7" href="javascript:;" title="罗马数字7" onclick="box.Insert('Ⅶ');return false;"></a></li>
                    <li><a class="Luoma8" href="javascript:;" title="罗马数字8" onclick="box.Insert('Ⅷ');return false;"></a></li>
                    <li><a class="Luoma9" href="javascript:;" title="罗马数字9" onclick="box.Insert('Ⅸ');return false;"></a></li>
                    <li><a class="Luoma10" href="javascript:;" title="罗马数字10" onclick="box.Insert('Ⅹ');return false;"></a></li>
                    <li><a class="Te001"></a></li>
                    <li><a class="Te002"></a></li>
                    <li><a class="Te003"></a></li>
                    <li><a class="Te004"></a></li>
                    <li><a class="Te005"></a></li>
					<li><a class="Te006"></a></li>
                    <li><a class="Qingkong_te" href="javascript:;" title="清空" onclick="FE_Clear();return false;"></a></li>
                </ul>

				<div class="clear"></div>
				<div editable="true" class="FEBox" id="FEBox" style="min-height:100px;_height:100px;"><div lineno="1" enter="br" class="Reserve InputLayer ReserveHover" clsname="Reserve InputLayer" signtype="Edit" id="1001" contenteditable="true"></div></div>
				<!--div class="FEeditorputin"><input type="button" value="提交" onclick="parseMathML();" /></div-->
			</div>
		</div>
	</div>
	
	<div style="display: none;" id="FE_ico" class="FE_ico">
		<!--FE_ico_Click:参数设定打开公式编辑器时默认为数学还是理化，0：数学 1：理化-->
    	<a href="javascript:;" title="打开公式编辑器" onclick="FE_ico_Click(0);return false;"></a>
    </div>
    <script type="text/javascript">
        FE_ico_Click(0);
    </script>


</body></html>