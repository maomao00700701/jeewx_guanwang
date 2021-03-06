<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta name="format-detection" content="telephone=no">
    <title>订单支付</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
    <meta name="format-detection" content="telephone=no">
    <script src="plug-in/shop/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="plug-in/shop/js/yyucadapter.js.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="plug-in/shop//css/c4.css">
</head><body><div id="top">

</div>
<div id="scnhtm5" class="m-body">
<!--主体-->
<div id="content">
<div id="c_wg.jdpay_show" style="">
<div class="wx_bar">
    <div class="wx_bar_back">
        <a id="indexBack" href="javascript:history.go(-1);">
        </a>
    </div>
    <div class="wx_bar_tit">
        确认订单
    </div>
</div>
<div class="wx_wrap">

<div id="sendTo" class="send_to" dzid="250">
    <div class="address_defalut">
        <ul class="selected" id="editAddBtn" onclick="$(&#39;.account_tips&#39;).toggle();">
            <li>
            	 <label><input type="radio" name="addressDetail" checked="checked" value="${order.addressDetail}" />${order.addressDetail} </label>
            </li>
        </ul>
    </div>

</div>
<script type="text/javascript">
    function setthisdz (o){
        var tp = $(o).parent();
        var shshr = $('#sendTo').find('.shshr').text();
        var shdh = $('#sendTo').find('.shdh').text();
        var shdz = $('#sendTo').find('.shdz').text();
        var dzid = $('#sendTo').attr('dzid');
        $('#sendTo').find('.shshr').text(tp.find('.shshr').text());
        $('#sendTo').find('.shdh').text(tp.find('.shdh').text());
        $('#sendTo').find('.shdz').text(tp.find('.shdz').text());
        $('#sendTo').attr('dzid',$(o).attr('dzid'));
        $(o).attr('dzid',dzid);
        tp.find('.shshr').text(shshr);
        tp.find('.shdh').text(shdh);
        tp.find('.shdz').text(shdz);
        $('.account_tips').hide();
    }

    function jszjg(){
        var zjg = 0;
        $('.only').each(function(){
            var jg = parseFloat($.trim($(this).find('.zzdj').attr('reljg').replaceAll(',','')))*parseInt($.trim($(this).find('.zzsl').val()));
            zjg += jg;
        });

        $('#totalPrice').text('￥'+zjg);
        var byj = parseInt($('#totalPrice2').attr('byjg'));
        var yfzh = 0;
        if(byj<=0 || zjg<byj){
            //不包邮
            $('.dbyfj').each(function(){
                yfzh = yfzh + parseFloat($(this).attr('yf'));
            });


        }

        if(yfzh==0){
            $('#totalPrice2').text('包邮(￥0)');
        }else{
            $('#totalPrice2').text('￥'+yfzh);
        }
        $('#totalPrice3').text('￥'+(yfzh+zjg));
        window.myzfy = yfzh+zjg;
        $('#cod_total').html(zjg);
        $('#cod_yun_nouse').html(yfzh);
        window.yfzh = yfzh;
    }

    function towxzf(){
        window.paytyp = '3';
        $('#codFloat').show();
    }
    function tolizf(){
        window.paytyp = '0';
        $('#codFloat').show();
    }
    function toalzf(){
    	var id = $("#orderid").val()
        $('#codFloat').show();
    }
    function totezf(){
        window.paytyp = '2';
        $('#codFloat').show();
    }
    function torealpay(){
     	var id = $("#orderid").val();
       $('#zzzfform').submit();
       
    }
</script>
<div class="order_info" id="orderList">
    <h3>
        订单信息<input id="orderid" name="orderid" type="hidden" va/>
    </h3>
    	<dl class="only" style="position: relative;">
	        <dd>
	            <ul>
	                <li class="hproduct">
	                    <img class="photo" src="${goods.titleImg}" alt="">
	                    <p class="fn">${goods.title}</p>
	                    <!--         
	                    <p class="sku">
	                    	<em>原价： </em>
	                         <span>
	                          	￥<span class="zzdj" reljg="880">${goodsEntity.price}</span>
	                         </span>                                    
	                    </p>
	                     --> 
	                    <p class="sku">
	                        <em> 现价：</em>
	                         <span>  
	                        	 ￥<span class="zzdj" reljg="880">${goods.realPrice}</span>
	                         </span>                     
	                    </p>
	                    <p class="sku">
	                        <em>数量:</em>
	                        <span>
	                             <input maxlength="4" class="count" id="buycount" type="text" name="buycount" readonly="readonly" value="${order.buycount}" onblur="jszjg()" onkeyup="jszjg()" onchange="jszjg()">
	                        </span>                  
	                    </p>
	                    <!-- 
	                    <p class="sku">
	                   	 	<em>可购</em>
	                        <span id="canBuyNum" class="last" style="">
	                             <strong tag="skuNum" class="zzsy">${goodsEntity.sellCount}</strong>件
	                       </span>  
	                    </p>
	                     -->
	                </li>
	                <li class="shipping" orderid="1">
	                    <strong>配送方式</strong>
	                    <span id="noSelectPage" class="dbyfj" yf="0.00">${order.expressName}</span>                                              
	                </li>
	               
	            </ul>
	            
	        </dd>
	    </dl>
     <li class="shipping" orderid="1">
          <strong>买家留言</strong>
          <span id="leaveword" class="dbyfj">
          <textarea rows="4" cols="35" name="leaveword" id="leavewordtemp"></textarea>
          </span>                                              
      </li>
      
</div>
<div class="pay_area" id="pay_area" style="-webkit-transform-origin: 0px 0px; opacity: 1; -webkit-transform: scale(1, 1);">
    <p class="price">
	        总价:<strong id="totalPrice">${totalPrice}</strong>&nbsp;&nbsp; <input name="yfmny" type="hidden" id="yfmny" />  
	         邮费:<strong id="totalPrice2">${expressPrice}</strong>&nbsp;&nbsp;
	        合计:<strong id="totalPrice3">${totalPrice+expressPrice}</strong>   
    </p>
    <p class="action">
        <a href="javascript:void(0);" id="goQQPay" class="qq" onclick="toalzf()">支付宝支付 </a>
        <a href="javascript:void(0);" id="codGoPayFloat" onclick="tolizf()">货到付款 </a>
        <a href="javascript:void(0);" id="unionPay" style="display:none;" class="online">网银在线支付 </a>
    </p>
    <p class="assure">支付宝担保，安全支付 </p>
</div>
</div>
</div>
</div>


<div id="codFloat" style="display:none;">
    <div class="wx_mask">
    </div>
    <div class="wx_confirm">
        <div class="wx_confirm_inner">
            <div class="wx_confirm_hd">
                <div class="wx_confirm_tit">是否确认提交订单 并支付？</div>
                <div class="wx_confirm_close" id="codGoPayCancel2" onclick="$(&#39;#codFloat&#39;).hide();" title="关闭"></div>
            </div>
            <form id="zzzfform" method="post" target="_self" action="weixinShopDealController.do?goPayPage">
            	<input type="hidden" name="id" id="orderid" value="${order.id }" />
            	<input type="hidden" name="payType" id="payType" value="1"/>
                <div class="wx_confirm_bd">
                    <div class="wx_confirm_cont">
                        <div class="confirm_order">
                            <p>付款金额：
                            	<span class="price">¥<span id="cod_total">${totalPrice+expressPrice}</span></span>
                            </p>
                        </div>
                    </div>
                    <div class="wx_confirm_btns">
                        <button type="button" id="codGoPay" onclick="torealpay()">确认</button>
                        <button type="cancel" id="codGoPayCancel" onclick="$(&#39;#codFloat&#39;).hide();return false;"> 取消</button> 
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!--foot-->
<div class="wx_footer">
    <div class="mfooter" id="wxgjfooter" style="text-align: center;width: 100%;height: 20px;line-height: 20px;margin-top:10px;">
        <span class="sp2"><a href="http://www.weixinguanjia.cn/weiweb/3702/" style="color: #5e5e5e;font-size: 12px;"> 技术支持：捷微团队JeeWx</a></span>
    </div>
    <div style="width: 0px;height: 0px;overflow: hidden;">
        <script src="./确认购买_files/z_stat.php" language="JavaScript"></script><script src="./确认购买_files/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1000151448" target="_blank" title="站长统计">站长统计</a>
        <script type="text/javascript">
            var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
            document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F43da571de43e9d6228927d0883b8b8b4' type='text/javascript'%3E%3C/script%3E"));
        </script><script src="./确认购买_files/h.js" type="text/javascript"></script>

    </div>

</div>
<script>
 
</script></body>
</html>