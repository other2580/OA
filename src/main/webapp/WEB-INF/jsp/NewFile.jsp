<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>  
	    <meta charset="UTF-8">  
	    <title>异步加载树</title>  
	    <!-- <link rel="stylesheet" href="static/zTree/zTreeStyle.css"> -->
	    <script type="text/javascript" src="static/zTree/jquery-1.4.4.min.js"></script>  
	    <script type="text/javascript" src="static/zTree/jquery.ztree.core.js"></script>  
	    <script type="text/javascript"> 
		    var treeTrade;  
		    var settingTrade = {  
		        data: {  
		            simpleData: {  
		                enable : true,  
		                idKey : "id",  
		                pIdKey : "parentId"  
		            }  
		        },  
		        async: {  
		            enable: true,  
		            url:"document",  
		            autoParam:["id"],  
		            dataFilter: filter  
		        },  
		        callback: {  
		            onClick: onClickTrade  
		        }  
		    };  
		    function Node(id, pId, name, isParent){  
		        this.id = id;    
		        this.pId = pId;    
		        this.name = name;  
		        this.isParent = isParent;  
		    };  
		    function filter(treeId, parentNode, childNodes) {  
		        var filterNodes = new Array()  
		        if (!childNodes) return null;  
		        var isParent;  
		        for (var i=0, l=childNodes.length; i<l; i++) {  
		            childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');  
		            if(childNodes[i].leaf==0){  
		                isParent = true;  
		                filterNodes.push(new Node(childNodes[i].id, childNodes[i].pId, childNodes[i].name, isParent));  
		            }else{  
		                isParent = false;  
		                filterNodes.push(new Node(childNodes[i].id, childNodes[i].pId, childNodes[i].name, isParent));  
		            }  
		        }  
		        return filterNodes;  
		    };  
		    function onClickTrade(e, treeId, treeNode) {  
		        var zTree = $.fn.zTree.getZTreeObj("treeTrade"),  
		        nodes = zTree.getSelectedNodes(),  
		        tradeName = "";  
		        tradeId = "";  
		        nodes.sort(function compare(a,b){return a.id-b.id;});  
		        for (var i=0; i<nodes.length; i++) {  
		            tradeId += nodes[i].id + ",";  
		            tradeName += nodes[i].name + ",";  
		        }  
		        if (tradeId.length > 0 ) tradeId = tradeId.substring(0, tradeId.length-1);  
		        if (tradeName.length > 0 ) tradeName = tradeName.substring(0, tradeName.length-1);  
		        var tradeIdObj = $("#tradeId");  
		        var tradeNameObj = $("#tradeName");  
		        tradeIdObj.attr("value", tradeId);  
		        tradeNameObj.attr("value", tradeName);  
		    };  
		    function showMenuTrade() {  
		        var treeNodes = new Array();  
		        var tradeObj = $("#tradeName");  
		        var tradeOffset = $("#tradeName").offset();  
		        $("#tradeContent").css({  
		            left:0/*tradeOffset.left + "px"*/,  
		            top:/*tradeOffset.top + */tradeObj.outerHeight() + "px"}).slideDown("fast");  
		        $("body").bind("mousedown", onBodyDownTrade);  
		        $.ajax({  
		            url : "document",  
		            type : "post",  
		            async : true,  
		            dataType: "json",  
		            success : function(data){  
		                var isParent;  
		                $.each(data, function(i, item){  
		                    if(item.leaf==0){  
		                                isParent = true;  
		                            }else{  
		     							isParent = false;  
		                            };  
		                            treeNodes.push(new Node(item.id, item.pId, item.name, isParent));  
		                            $.fn.zTree.init($("#treeTrade"), settingTrade, treeNodes);  
		                });  
		               }  
		        });  
		    };  
		    function hideMenuTrade() {  
		        $("#tradeContent").fadeOut("fast");  
		        $("body").unbind("mousedown", onBodyDownTrade);  
		    };  
		    function onBodyDownTrade(event) {  
		        if (!(event.target.id == "menuBtn" || event.target.id == "tradeContent" || $(event.target).parents("#tradeContent").length>0)) {  
		            hideMenuTrade();  
		        }  
		    };   
	    </script>  
	</head>  
	<body>  
		<div>  
		    <input type="text" name="etp.tradeName" id="tradeName" readonly="readonly"/>  
			<div class="zTreeDemoBackground left">  
			    <ul class="list">  
			        <li id="tradeContent" class="menuContent" style="position:absolute;left:0;top:-10px;z-index:800;background:#fff;border-left:1px solid #aaa;border-right:1px solid #aaa;border-bottom:1px solid #aaa;display:none;">  
			    <span style="white-space: pre;">        </span><ul id="treeTrade" class="ztree" style="width:164px;"></ul>  
			        </li>  
			    </ul>  
			</div>
			<input type="button" name="tradeBtn" value="选&nbsp;&nbsp;择" id="tradeBtn" onclick="showMenuTrade(); return false;"/>    
		</div>  
	</body>  
  
</html>  