<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">

<link rel="stylesheet" href="static/dist/themes/default/style.min.css" />
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">

<script src="static/js/jquery.contextmenu.js"></script>

<link rel="stylesheet" href="static/js/jquery.contextmenu.css">

<style type="text/css">
	#Add{height: 50px;background-color:#f5f5f8; border:5px solid #E0EEE0; border-radius:5px;}
	#file{height: 600px;margin-top:5px;background-color:#f5f5f5; border:5px solid #bce8f1; border-radius:5px;}
	#fileTitle{height:40px;width:100%;}
	.labelFolder{margin-left: 50px; margin-top: 30px; float: left;}
	ul,li{ margin:0; padding:0; list-style:none; font-size:12px;}  
	.popup_menu{position:absolute; z-index:90; border:1px solid #AEAEAE; padding:2px; width:80px;border-radius:5px;}  
	.popup_menu a{ display:block; color:#325B8E; text-indent:12px; text-decoration:none; height:26px; line-height:25px; padding-right:5px;}  
	.popup_menu a:hover{ background:#57B4E4; color:#fff; border-radius:5px;}
	
	.shade{
		width:100%;
		height: 100%;
		position: absolute;
		top: 0px;
		left: 0px;
		display: none;
	}
	.wrap-ms-right{
		list-style: none;
		position: absolute;
		top: 0;
		left: 0;
		padding: 5px 0;
		min-width: 80px;
		margin: 0;
		display: none;
		font-family: "微软雅黑";
		font-size: 14px;
		background-color: #fff;
		border: 1px solid rgba(0, 0, 0, .15);
		box-sizing: border-box;
		border-radius: 4px;
		-webkit-box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		-moz-box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		-ms-box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		-o-box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}
	.ms-item{
		height: 30px;
		line-height: 30px;
		text-align: center;
		cursor: pointer;
	}
	.ms-item:hover{
		background-color: #343a40;
		color: #FFFFFF;
	}
	
	ul{list-style-type: none;}
	a{text-decoration: none;}
	.labelFolder>ul>li{
		float: left;
		background-color: #009E94;
		height: 50px;
		line-height: 50px;
		width: 100%;
		margin: 10px 0px;
		
	}
	.labelFolder a{display: block}
	
	.a-upload{
        padding: 4px 10px;
        height: 34px;
        width: 93px;
        line-height: 28px;
        position: relative;
        cursor: pointer;
        color: #fff;
        background-color: blue;
        border-color: #bce8f1;
        border-radius: 4px;
        overflow: hidden;
        display: inline-block;
        *display: inline;
        *zoom: 1;
    }
    .a-upload input{
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
        filter: alpha(opacity=0);
        cursor: pointer
    }
    .a-upload:hover{
        color: #FFFFFF;
        background: #337ab7;
        border-color: #204d74;
        text-decoration: none;
    }
	
	#uploadForm{float: left;margin-top: 4px;}
	
	.m{ margin-right: auto; margin-left: auto; width: 500px; height: 500px; border: 1px dashed #666666; padding: 6px; margin-top: 50px; margin-bottom: 10px; background-color: #2E2E2E; }

	#tooltips{
        width:250px;
        height:100px;
        border:solid 1px white;
        background-color:white;
        position:absolute;
    }
</style>

<div class="main-content">
	<div class="main-content-inner">
		<div class="page-content">

			<div class="ace-settings-container" id="ace-settings-container">
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
					<i class="ace-icon fa fa-cog bigger-130"></i>
				</div>
	
				<div class="ace-settings-box clearfix" id="ace-settings-box">
					<div class="pull-left width-50">
						<div class="ace-settings-item">
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="no-skin" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
							<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
							<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
							<label class="lbl" for="ace-settings-add-container">
								Inside
								<b>.container</b>
							</label>
						</div>
					</div><!-- /.pull-left -->
	
					<div class="pull-left width-50">
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
							<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
							<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
							<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
						</div>
					</div><!-- /.pull-left -->
				</div><!-- /.ace-settings-box -->
			</div><!-- /.ace-settings-container -->

			<div class="row" style="margin-left: 30px;margin-bottom: 15px;">
	    		<h2><i class="fa fa-folder-o" aria-hidden="true"></i>&nbsp;&nbsp;文件管理</i></h2>
	    	</div>

			<div class="row">
				<!-- /.col -->
				<div class="col-xs-12">
					
					<div class="alert alert-info">
						<i class="ace-icon fa fa-hand-o-right"></i>
						Please note that demo server is not configured to save uploaded files, therefore you may get an error message.
						<button class="close" data-dismiss="alert">
							<i class="ace-icon fa fa-times"></i>
						</button>
					</div>
				
					<div class="col-md-2">
						 <li id="ajson0" class="jstree-node">
                            <a href="#" id="arrow"><i class="fa fa-files-o fa-fw"></i> 根目录<span class="fa arrow"></span></a>

                                <ul id="xx">
                                    <div id="jsTree"></div>
                                </ul>

                            <!-- /.nav-second-level -->
                        </li>
					</div>
					<div class="col-md-10">
						<div class="col-xs-12">
							
						</div>
						<div class="col-md-12">
							
							<div id="Add" class="col-md-12" style="margin-top: 5px;">
								<div style="margin-top: 4px;float: left;">
									<input type="hidden" value="" id="imgreturn"/>
									<img id="return" width="30px" height="30px" alt="" src="static/images/return.svg">&nbsp;&nbsp;&nbsp;&nbsp;
									<img id="imgAdd" width="30px" height="30px" alt="" src="static/images/add.png">
									<label id="AddSubmit">
										<input type="text" id="addName" name="name" style="border-radius:5px;"/>
										<input type="hidden" name="type" value="FOLDER"/>
										<input type="hidden" id="addId" name="id"/>
										<button id="SaveSubmit" class="btn btn-default">新建文件夹</button>
									</label>
								</div>
								
								<form action="test_upload" method="post" enctype="multipart/form-data" id="uploadForm">  
							    	<span style="white-space:pre;"> </span>
							    	<input type="hidden" id="addId2" name="id"/>
							    	<a href="javascript:;" class="a-upload mr10"><i class="fa fa-cloud-upload" aria-hidden="true"></i>上传文件<input type="file" id="uploadFile" name="multipartFile" onchange="upload();"></a>  
							    </form>
								
							</div>
							
							<div id="file" style="margin-top: 60px;">
								<div id="fileTitle">
									 <input type="text" class="form-control" id="exampleInputEmail1" placeholder="/: 根目录">
								</div>
								<div id="fileSon" class="col-md-12">
								
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
</div>
<!-- /.main-content -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script>

<!-- <![endif]-->

<!--[if IE]>
	<script src="static/assets/js/jquery-1.11.3.min.js"></script>
	<![endif]-->
<script type="text/javascript">
	if ('ontouchstart' in document.documentElement)
		document.write("<script src='static/assets/js/jquery.mobile.custom.min.js'>" + "<"+"/script>");
</script>
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>

<!-- ace scripts -->
<script src="static/assets/js/ace-elements.min.js"></script>

<!-- inline scripts related to this page -->

<script src="static/dist/jstree.js"></script>
<script type="text/javascript">
    $(function() {    
    	 var nodess=new Array();
    	 var inx=0;
         $('#ajson0').click(function() {             	           	
        	var node=this.id;
        	var ss=node.charAt(node.length-1);
	         $("#jsTree").jstree({                		
	                 "core" : {  
	                     "themes" : {  
	                         "responsive": false  
	                     },   
	                     // so that create works  
	                     "check_callback" : true,  
	                     'data' : function (obj, callback) {                          	   
	                         var jsonstr="[]";  
	                         var jsonarray = eval('('+jsonstr+')');                               
	                     	$.getJSON("document?parentId=0",function(jsonfromList){
	                  		var arrays= jsonfromList;  
	                          for(var i=0 ; i<arrays.length; i++){                                      
	                              var arr = {  
	                                      "id":"json"+arrays[i].id,  
	                                      "parent":ss==0?"#":node,  
	                                      "text":arrays[i].name,
	                                      "type":arrays[i].type,
	                              }
	                              console.log(arrays[i].documents)
	                              jsonarray.push(arr);
	                              if(arrays[i].documents.length){
	                            	  for(var s=0 ; s<arrays[i].documents.length; s++){
	  	                              	var arrs = {  
	  	                                          "id":"json"+arrays[i].documents[s].id,  
	  	                                          "parent":"json"+arrays[i].id,  
	  	                                          "text":arrays[i].documents[s].name, 
	  	                                          "type":arrays[i].documents[s].type,
	  	                                  }  
	  	                              	jsonarray.push(arrs);
	  	                              }        
	                              }
	                          }                         
	                          callback.call(this, jsonarray); 
	                  	});                                                          
	                     }  
	                 }, 
	                 "types" : {
	
	                     "FOLDER": {
	
	                         "icon" : "${pageContext.request.contextPath}/static/images/folder.png"
	
	                       },
	
	                     "docx": {
	
	                         "icon" : "${pageContext.request.contextPath}/static/images/docx.png"
	
	                       },
	
	                     "txt": {
	
	                         "icon" : "${pageContext.request.contextPath}/static/images/txt.png"
	
	                         },
	
	                    "jpg": {
	
	                         "icon" : "${pageContext.request.contextPath}/static/images/image.png"
	
	                         },
	                         
                        "xlsx": {
                       		
                         	"icon" : "${pageContext.request.contextPath}/static/images/docx.png"

                       		}
	
	                 },
	                 "plugins" : [ "types"]
	             }).bind("select_node.jstree", function(event, data) {  
	          	   var inst = data.instance;   
	          	   var bol=true;
	               var selectedNode = inst.get_node(data.selected); 
	               var selectid=selectedNode.id;
	               loadConfig(inst, selectedNode);
	             });
	         
       });               
         function loadConfig(inst, selectedNode){    
        	 console.log(selectedNode.type)
             var temp = selectedNode.text;   
             inst.open_node(selectedNode);  
             var xx=selectedNode.id;
             var mm;
             if(xx.length>5){
            	 var cha=xx.length-4;
            	 mm=xx.substring(4,4+cha);   
             }else{
            	 mm=xx.charAt(xx.length-1);   
             }
          	$.getJSON("document?parentId="+mm+"",function(data){
          		if(data!="") {  
          			var arrays= data;
                     for(var i=0 ; i<arrays.length; i++){                                       
                    	 for(var s=0 ; s<arrays[i].documents.length; s++){
                          	var arrs = {  
                                 "id":"json"+arrays[i].documents[s].id,  
                                 "parent":"json"+arrays[i].id,  
                                 "text":arrays[i].documents[s].name,  
                                 "type":arrays[i].documents[s].type,
                              }
                          	inst.create_node(document.getElementById("json"+arrays[i].id),arrs,"last"); 
                          }             
                     }
                }
          		
          		var nn = $("#addId").val();
          		$.ajax({//通过ajax动态
                    url: 'showFileJtree',
                    dataType: 'json',
                    type: 'post',
                    data:{'parentId':mm, "id":mm},
                    success: function (json) { // 获取当前月的数据
                    	$("#imgreturn").val(nn);
                    	$("#fileSon").empty();
                    	$("#addId").val(mm);
                    	$("#addId2").val(mm);
                    	$("#exampleInputEmail1").val(json.title);
                    	if(json.doc == ''){
                    		var line = '<div style="margin-top: 200px;margin-left: 500px;color:#E0EEE0; font-style:italic;font-size: 60px"><p>文件为空</p></div>';
                    		$("#fileSon").append(line);
                    	}else{
                        	$.each(json.doc, function (index,c) {
                        		var line = "";
                        		if(c.type == "FOLDER"){
                        			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder2.png"><p class="fileName">'+c.name+'</p></label>';
                        		}else if(c.type == "txt" || c.type == "doc" || c.type == "xlsx" || c.type == "pptx"){
                        			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder1.svg"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                        		}else if(c.type == "jpg" || c.type == "png"){
                        			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/jpg.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                        		}else if(c.type == "rar" || c.type == "zip"){
                        			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/yasuo.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                        		}
        						$("#fileSon").append(line);
        					});
                    	}
                    }
                });
          		
          	})                
          }          
    });
</script>


<script type="text/javascript">
	jQuery(function($) {

		$("#arrow").click();
		
		load();
		
		$("#arrow").click(function() {
			load();
		})
		
		//初始加载
		function load() {
			$.ajax({//通过ajax动态
	            url: 'showFile',
	            dataType: 'json',
	            type: 'post',
	            data:{'parentId':0},
	            success: function (json) { // 获取当前月的数据
	            	$("#imgreturn").val(0);
	            	$("#fileSon").empty();
	            	$("#addId").val(0);
	            	$("#addId2").val(0);
	            	$.each(json, function (index,c) {
	            		var line = "";
	            		if(c.type == "FOLDER"){
	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder2.png"><p class="fileName">'+c.name+'</p></label>';
	            		}else if(c.type == "txt" || c.type == "doc" || c.type == "xlsx" || c.type == "pptx"){
	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder1.svg"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
	            		}else if(c.type == "jpg" || c.type == "png"){
	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/jpg.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
	            		}else if(c.type == "rar" || c.type == "zip"){
                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/yasuo.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                		}
						$("#fileSon").append(line);
					});
	            }
	        });
		}
		
		
		try {
			Dropzone.autoDiscover = false;

			var myDropzone = new Dropzone(
				'#dropzone',
				{
					previewTemplate : $('#preview-template').html(),
	
					thumbnailHeight : 120,
					thumbnailWidth : 120,
					maxFilesize : 10,
	
					//addRemoveLinks : true,
					//dictRemoveFile: 'Remove',
	
					dictDefaultMessage : '<span class="bigger-150 bolder"><i class="ace-icon fa fa-caret-right red"></i> Drop files</span> to upload \
				<span class="smaller-80 grey">(or click)</span> <br /> \
				<i class="upload-icon ace-icon fa fa-cloud-upload blue fa-3x"></i>',
				thumbnail : function(file, dataUrl) {
					if (file.previewElement) {
						$(file.previewElement).removeClass(
								"dz-file-preview");
						var images = $(file.previewElement).find(
								"[data-dz-thumbnail]").each(function() {
							var thumbnailElement = this;
							thumbnailElement.alt = file.name;
							thumbnailElement.src = dataUrl;
						});
						setTimeout(function() {
							$(file.previewElement).addClass(
									"dz-image-preview");
						}, 1);
					}
				}

			});

			//simulating upload progress
			var minSteps = 6, maxSteps = 60, timeBetweenSteps = 100, bytesPerStep = 100000;

			myDropzone.uploadFiles = function(files) {
				var self = this;

				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					totalSteps = Math.round(Math.min(maxSteps, Math.max(
							minSteps, file.size / bytesPerStep)));

					for (var step = 0; step < totalSteps; step++) {
						var duration = timeBetweenSteps * (step + 1);
						setTimeout(
							function(file, totalSteps, step) {
								return function() {
									file.upload = {
										progress : 100 * (step + 1)
												/ totalSteps,
										total : file.size,
										bytesSent : (step + 1) * file.size
												/ totalSteps
									};

									self.emit('uploadprogress', file,
											file.upload.progress,
											file.upload.bytesSent);
									if (file.upload.progress == 100) {
										file.status = Dropzone.SUCCESS;
										self.emit("success", file,
												'success', null);
										self.emit("complete", file);
										self.processQueue();
									}
								};
							}(file, totalSteps, step), duration);
					}
				}
			}

			//remove dropzone instance when leaving this page in ajax mode
			$(document).one('ajaxloadstart.page', function(e) {
				try {
					myDropzone.destroy();
				} catch (e) {
				}
			});

		} catch (e) {
			
		}

	});
</script>


<script src="static/js/mouseRight.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

	$("#AddSubmit").hide();
	$("#imgAdd").click(function() {
		$("#AddSubmit").toggle();
	});
	
	
	//创建文件夹
	$("#SaveSubmit").click(function() {
		var id = $("#addId").val();
		var name = $("#addName").val();
		 var mm = $("#imgreturn").val();
		$.ajax({
            url: 'addFile',
            dataType: 'json',
            type: 'post',
            data:{"name":name,"parentId":id},
            success: function (json) { 
            	$("#imgreturn").val(mm);
            	$("#fileSon").empty();
            	$("#addId").val(id);
            	$("#addId2").val(id);
            	$.each(json, function (index,c) {
            		var line = "";
            		if(c.type == "FOLDER"){
            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder2.png"><p class="fileName">'+c.name+'</p></label>';
            		}else if(c.type == "txt" || c.type == "docx" || c.type == "xlsx" || c.type == "pptx"){
            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder1.svg"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
            		}else if(c.type == "jpg" || c.type == "png"){
            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/jpg.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
            		}else if(c.type == "rar" || c.type == "zip"){
            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/yasuo.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
            		}
					$("#fileSon").append(line);
				});
            	
            	//清空并隐藏添加框
            	$("#addName").val("");
            	$("#AddSubmit").hide();
            	
            }
        });
	});
	
	//上传文件
	function upload(){
        var form = new FormData(document.getElementById("uploadForm"));
        var id = $("#addId").val();
         $.ajax({  
             type: "POST",  
             url:"test_upload",  
             data:form, 
             // 下面三个参数要指定，如果不指定，会报一个JQuery的错误 
             cache: false,
             contentType: false,
             processData: false,
             async: false,  
             success: function(data) {  
 				if(data.ok){
 					alert(data.error);
 					$.ajax({//通过ajax动态
 	                    url: 'showFile',
 	                    dataType: 'json',
 	                    type: 'post',
 	                    data:{'parentId':id},
 	                    success: function (json) { 
 	                    	$("#imgreturn").val(id);
 	                    	$("#fileSon").empty();
 	                    	$("#addId").val(id);
 	                    	$("#addId2").val(id);
 	                    	$.each(json, function (index,c) {
 	                    		console.log(c.type);
 	                    		var line = "";
 	                    		if(c.type == "FOLDER"){
	 	   	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder2.png"><p class="fileName">'+c.name+'</p></label>';
	 	   	            		}else if(c.type == "txt" || c.type == "doc" || c.type == "xlsx" || c.type == "pptx"){
	 	   	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder1.svg"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
	 	   	            		}else if(c.type == "jpg" || c.type == "png"){
	 	   	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/jpg.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
	 	   	            		}else if(c.type == "rar" || c.type == "zip"){
                        			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/yasuo.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                        		}
 	    						$("#fileSon").append(line);
 	    					});
 	                    }
 	                });
 				}else{
 					alert(data.error);
 				}
             }  
         }); 
     };
     
     
     //双击事件
     $("#fileSon").on("dblclick", ".labelFolder", function(){ 
    	//判断是否是文件夹
    	
 		var mm = $(this).children(".val").val();
 		var nn = $("#addId").val();
 		
 		var str = $(this).children(".fileName").text();
 		if(str.indexOf(".")>=0){
 			$.ajax({//通过ajax动态
 	            url: 'openFile',
 	            dataType: 'json',
 	            type: 'post',
 	            data:{'Filed':str},
 	            success: function (json) {},
 	            error: function() {
					alert("文件损失，请从新添加！");
				}
 			});
 		}else{
 			$.ajax({//通过ajax动态
 	            url: 'showFileChick',
 	            dataType: 'json',
 	            type: 'post',
 	            data:{'parentId':mm, "title":str},
 	            success: function (json) { // 获取当前月的数据
 	            	$("#imgreturn").val(nn);
 	        		$("#fileSon").empty();
 	        		$("#addId").val(mm);
 	            	$("#addId2").val(mm);
 	            	$("#exampleInputEmail1").val(json.title);
 	            	if(json.doc == ''){
 	            		var line = '<div style="margin-top: 200px;margin-left: 500px;color:#E0EEE0; font-style:italic;font-size: 60px"><p>文件为空</p></div>';
 	            		$("#fileSon").append(line);
 	            	}else{
 	                	$.each(json.doc, function (index,c) {
 	                		var line = "";
 	                		if(c.type == "FOLDER"){
 	                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder2.png"><p class="fileName">'+c.name+'</p></label>';
 	                		}else if(c.type == "txt" || c.type == "doc" || c.type == "xlsx" || c.type == "pptx"){
 	                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder1.svg"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
 	                		}else if(c.type == "jpg" || c.type == "png"){
 	                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/jpg.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
 	                		}else if(c.type == "rar" || c.type == "zip"){
 	                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/yasuo.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
 	                		}
 							$("#fileSon").append(line);
 						});
 	            	}
 	            }
 	        });
 			
 		}
 		
 	}); 
     
     
    $("#return").click(function() {
		var mm = $("#imgreturn").val();
		$.ajax({//通过ajax动态
            url: 'showReturn',
            dataType: 'json',
            type: 'post',
            data:{'parentId':mm},
            success: function (json) { // 获取当前月的数据
            	$("#fileSon").empty();
        		$("#addId").val(mm);
            	$("#addId2").val(mm);
            	$("#imgreturn").val(json.id);
            	$("#exampleInputEmail1").val(json.title);
            	if(json.document == ''){
            		var line = '<div style="margin-top: 200px;margin-left: 500px;color:#E0EEE0; font-style:italic;font-size: 60px"><p>文件为空</p></div>';
            		$("#fileSon").append(line);
            	}else{
                	$.each(json.document, function (index,c) {
                		var line = "";
                		if(c.type == "FOLDER"){
                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder2.png"><p class="fileName">'+c.name+'</p></label>';
                		}else if(c.type == "txt" || c.type == "doc" || c.type == "xlsx" || c.type == "pptx"){
                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder1.svg"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                		}else if(c.type == "jpg" || c.type == "png"){
                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/jpg.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                		}else if(c.type == "rar" || c.type == "zip"){
                			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/yasuo.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                		}
						$("#fileSon").append(line);
					});
            	}
            }
        });
	});

</script>


<script src="static/js/jquery.contextmenu.js"></script>
<link rel="stylesheet" href="static/js/jquery.contextmenu.css">
<script>
  $(function() {
	  $("#fileSon").on("click", ".labelFolder", function(){
		  var fileName = $(this).find(".fileName").text();
		  var aa = $(this).children(".val").val();
		  var id = $("#addId").val();
		  var mm = $("#imgreturn").val();
		  $(this).contextPopup({
		      items: [
		        {label:'下载', icon:'static/images/down.png', action:function() {
		        	window.location.href="test_download?filename="+fileName; 
		        } },
		        {label:'删除', icon:'static/images/del.png', action:function() {
		        	$.ajax({
			            url: 'deleteDocument',
			            dataType: 'json',
			            type: 'post',
			            data:{"id":aa},
			            success: function (json) { 
			            	//刷新页面
			            	console.log("123456789");
			            }
			        });
					
					$.ajax({//通过ajax动态
 	                    url: 'showFile',
 	                    dataType: 'json',
 	                    type: 'post',
 	                    data:{'parentId':id},
 	                    success: function (json) { 
 	                    	$("#imgreturn").val(mm);
 	                    	$("#fileSon").empty();
 	                    	$("#addId").val(id);
 	                    	$("#addId2").val(id);
 	                    	$.each(json, function (index,c) {
 	                    		var line = "";
 	                    		if(c.type == "FOLDER"){
	 	   	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder2.png"><p class="fileName">'+c.name+'</p></label>';
	 	   	            		}else if(c.type == "txt" || c.type == "doc"){
	 	   	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/folder1.svg"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
	 	   	            		}else if(c.type == "jpg" || c.type == "png"){
	 	   	            			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/jpg.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
	 	   	            		}else if(c.type == "rar" || c.type == "zip"){
                        			line = '<label class="labelFolder" style="width: 80px; height: 70px; text-align: center;"><input class="val" type="hidden" value="'+c.id+'"/><img alt="" width="40px" height="40px" src="static/images/yasuo.png"><p class="fileName">'+c.name+"."+c.type+'</p></label>';
                        		}
 	    						$("#fileSon").append(line);
 	    					});
 	                    }
 	                });
		        } },
		        {label:'属性', icon:'', action:function() { alert('clicked 3') } }
		      ]

		 });
	  });
	  
		//点击任意部位隐藏  
		$(document).click(function(){  
		    $(".contextMenuPlugin").hide();  
		});
		
		
		
		
		$("#fileSon").on("mouseover mouseout", ".labelFolder", function(e){
			var vv = $(this);
			 if(e.type == "mouseover"){
				 timer = setTimeout(function(){
					//鼠标在上面或离开时的提示层，这两个效果不能同时显示
		            var $div = $("<div id='tooltips'></div>");
		            $div.css({"left":e.pageX,"top":e.pageY});
					$div.fadeIn(1000);
		            $("body").append($div);
			     },2000);
			 }else if(e.type == "mouseout"){
				clearTimeout(timer);
				var $div = $("#tooltips");
	            if($div)
	            {
	                $div.remove();
	            }
			 }
		});
		
	       

  });
</script>





















