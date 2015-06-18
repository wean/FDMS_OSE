Date.prototype.Format = function(formatStr)   
{   
    var str = formatStr;   
    var Week = ['日','一','二','三','四','五','六'];  
    
    str=str.replace(/yyyy|YYYY/,this.getFullYear());   
    str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));   
    
    str=str.replace(/MM/,this.getMonth()>9?this.getMonth().toString():'0' + this.getMonth());   
    str=str.replace(/M/g,this.getMonth());   
    
    str=str.replace(/w|W/g,Week[this.getDay()]);   
    
    str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());   
    str=str.replace(/d|D/g,this.getDate());   
    
    str=str.replace(/hh|HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());   
    str=str.replace(/h|H/g,this.getHours());   
    str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());   
    str=str.replace(/m/g,this.getMinutes());   
    
    str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());   
    str=str.replace(/s|S/g,this.getSeconds());   
    
    return str;   
}   



$("#btnSave").click(function(){
	saveData();
});

function saveData(){
    var json = {};
	$("div#main_content_wrap>div.container_12>form [fdata='fdata']").each(function(){
		if ($(this).attr("fdata-column")) {
            if ($(this).attr("type") == "radio" && $(this).is(":checked") == false){
                return;
            }
            var val = $(this).val();
            
            if ($(this).attr("type") == "checkbox"){
                val = $(this).is(":checked") ? 1 : 0;
            }
            if (val == "" && $(this).attr("type") == "password"){
                return;
            }
            //if (val == ""){
            //    return;
            //}
            if (!$(this).attr("fdata-parent")){
			    json[$(this).attr("fdata-column")] = val;
            } else {
                if (!($(this).attr("fdata-parent") in json)){
                    json[$(this).attr("fdata-parent")] = {};
                }

                if (!($(this).attr("fdata-parent-id") in json[$(this).attr("fdata-parent")])){
                    json[$(this).attr("fdata-parent")][$(this).attr("fdata-parent-id")] = {};
                }
                json[$(this).attr("fdata-parent")][$(this).attr("fdata-parent-id")][$(this).attr("fdata-column")] = val;
            }
		};
	});
    if (window.onSaving){
        window.onSaving(json);
    }
    $.ajax({
        type: "POST",
        url: "/action/setData?dataKey=" + $("form.form").attr("fdata-key") + "&dataId=" + $("form.form").attr("fdata-id") + "&m=" + Math.random(),
        data: JSON.stringify(json),
        success : function(data){
            if (data){
                data = eval("(" + data + ")")
                if (data){
                    if (data.code == "ok"){
                        alert("保存成功!");
                        location = document.referrer;
                    } else if (data.msg){
                        alert("保存失败 " + data.msg);
                    } else {
                        alert("保存失败!");
                    }
                }
            }
        },
        error: function(data){
            alert("保存失败!");
        }
    });
}

function delData(dataKey, dataId){
    if (confirm("确认删除！")){
        $.ajax({
            type: "POST",
            url: "/action/delData?dataKey=" + dataKey + "&dataId=" + dataId + "&m=" + Math.random(),
            success : function(data){
                if (data){
                    data = eval("(" + data + ")");
                    if (data){
                        if (data.code == "ok"){
                            alert("删除成功");
                            window.location.reload();
                        } else if (data.msg){
                            alert("删除失败 " + data.msg);
                        } else {
                            alert("删除失败！");
                        }
                    }
                }
            },
            error: function(data){
                alert("删除失败！")
            }
        });
    }
}

$(".select-complete:not(.hide)").select2();

$(".datepicker").datetimepicker({
	yearOffset:0,
	lang:'ch',
	timepicker:false,
	format:'Y-m-d',
	formatDate:'Y-m-d',
    allowBlank: true,
});

$(".file-browse").each(function () {
    var previewWidth = "auto";
    var previewHeight = "auto";
    var maxWidth = "auto";
    var maxHeight = "auto";
    var imgTips = "";

    if ($(this).attr("preview_width")) {
        previewWidth = $(this).attr("preview_width");
    }
    if ($(this).attr("preview_height")) {
        previewHeight = $(this).attr("preview_height");
    }
    if ($(this).attr("maxWidth")) {
        maxWidth = $(this).attr("maxWidth");
    }
    if ($(this).attr("maxHeight")) {
        maxHeight = $(this).attr("maxHeight");
    }
    if ($(this).attr("imgTips")) {
        imgTips = $(this).attr("imgTips");
    }
    $(this).parent().append("<button class='submit upload' type='button'>浏览 " + imgTips + "</button>");
    $(this).parent().append("<button class='submit paste fr' type='button'>粘帖 " + imgTips + "</button>");
    if ($(this).hasClass("image-uploader")) {
        $(this).parent().append("<img src='' alt='' width='" + previewWidth + "' height='" + previewHeight + "' style='max-width:" + maxWidth + "px;max-height:" + maxHeight + "px;margin-top:10px' />");
    }

    var hfId = $(this).parent().find("input[type=hidden].file-browse").eq(0).attr("id");
    $(this).parent().find("button.upload").upload({
        name: 'file',
        method: 'post',
        enctype: 'multipart/form-data',
        action: '/action/fileUpload?m=' + Math.random(),
        params: { relateId: hfId },
        onSubmit: function () {
            if (!$("#" + this.params()['relateId']).attr("nodel")) {
                this.params()['oldValue'] = $("#" + this.params()['relateId']).val();
            }
            this.params()['saveDir'] = $("#" + this.params()['relateId']).attr("save-dir");
        },
        onComplete: function (r) {
            if (r != null) {
                r = eval("(" + r + ")");
                if (r.relateId && r.url && r.value) {
                    $("#" + r.relateId).val(r.value);
                    if ($("#" + r.relateId).attr("onfileuploaded") &&
                        window[$("#" + r.relateId).attr("onfileuploaded")]) {
                        window[$("#" + r.relateId).attr("onfileuploaded")](r.value);
                    }
                    $("#" + r.relateId).parent().find("img").attr("src", r.url);
                    if (r.value) {
                        $("#" + r.relateId).parent().find("img").removeClass("hidden");
                    } else {
                        $("#" + r.relateId).parent().find("img").addClass("hidden");
                    }
                } else {
                    if (r.message) {
                        alert(r.message)
                    }
                }
            }
        }
    });
    $(this).parent().find("button.upload").parent().css("float", "left");
    $(this).parent().find("button.paste").click(function(){
        $(".paste-target").parent().find("button.paste").html("粘帖");
        $(".paste-target").removeClass("paste-target");
       
        $(this).parent().find("input[type=hidden].file-browse").addClass("paste-target");
        $(".paste-target").parent().find("button.paste").html("等待粘帖...");
    });

    if ($("#" + hfId).val()) {

        var imgSrc = $("#" + hfId).val();
        if (imgSrc.length > 4 && imgSrc.substring(0, 4).toLowerCase() == "http") {

        } else if (imgSrc.length > 0 && (imgSrc.substring(0, 1).toLowerCase() == "/" || imgSrc.substring(0, 1).toLowerCase() == "\\")) {

        } else if (imgSrc.indexOf("\\") >= 0) {
            imgSrc = "\\" + imgSrc;
        } else {
            imgSrc = "/" + imgSrc;
        }

        $("#" + hfId).parent().find("img").attr("src", imgSrc);
        $("#" + hfId).parent().find("img").removeClass("hidden");
    } else {
        $("#" + hfId).parent().find("img").addClass("hidden");
    }
});

function checkTask(){
    $.ajax({
        type: "POST",
        url: "/action/userNotify?m=" + Math.random(),
        success : function(data){
            
            if (data){
                data = eval("(" + data + ")")
                if (data){
                    var notifyMsg = " ";
                    if (data.UnCheckProfitCount){
                        notifyMsg += "未审核毛利表[" + data.UnCheckProfitCount + "] ";
                    }
                    if (data.UnApplyProfitCount){
                        notifyMsg += "未提交毛利表[" + data.UnApplyProfitCount + "] ";
                    }
                    $("#userNotify").html(notifyMsg);
                }
            }
        },
        error: function(data){
        }
    });
}

setInterval(checkTask, 30000); 
checkTask();

window.addEventListener("paste", function(event){
    // 添加到事件对象中的访问系统剪贴板的接口
    var clipboardData = event.clipboardData,
        i = 0,
        items, item, types;
    
    if( clipboardData ){
        items = clipboardData.items;
        
        if( !items ){
            return;
        }
        
        item = items[0];
        // 保存在剪贴板中的数据类型
        types = clipboardData.types || [];
        
        for( ; i < types.length; i++ ){
            if( types[i] === 'Files' ){
                item = items[i];
                break;
            }
        }
        
        // 判断是否为图片数据
        if( item && item.kind === 'file' && item.type.match(/^image\//i) ){
            // 读取该图片            
            imgReader( item );
        }
    }
});

var imgReader = function( item ){
    var file = item.getAsFile(),
        reader = new FileReader();
    
    // 读取文件后将其显示在网页中
    reader.onload = function( e ){
        if ($(".paste-target").length == 1){
            var jsonData = {};
            jsonData["payload"] = e.target.result;
            jsonData["relateId"] = $(".paste-target").attr("Id");
            if (!$(".paste-target").attr("nodel")) {
                jsonData['oldValue'] = $(".paste-target").val();
            }
            jsonData['saveDir'] = $(".paste-target").attr("save-dir");
            $.ajax({
                type: "POST",
                url: "/action/fileUpload?m=" + Math.random(),
                data: jsonData,
                success : function(r){
                    $(".paste-target").parent().find("button.paste").html("粘帖");
                    $(".paste-target").removeClass("paste-target");
                    if (r != null) {
                        r = eval("(" + r + ")");
                        if (r.relateId && r.url && r.value) {
                            $("#" + r.relateId).val(r.value);
                            if ($("#" + r.relateId).attr("onfileuploaded") &&
                                window[$("#" + r.relateId).attr("onfileuploaded")]) {
                                window[$("#" + r.relateId).attr("onfileuploaded")](r.value);
                            }
                            $("#" + r.relateId).parent().find("img").attr("src", r.url);
                            if (r.value) {
                                $("#" + r.relateId).parent().find("img").removeClass("hidden");
                            } else {
                                $("#" + r.relateId).parent().find("img").addClass("hidden");
                            }
                        } else {
                            if (r.message) {
                                alert(r.message)
                            }
                        }
                    }
                },
                error: function(data){
                }
            });
        }
    };

    // 读取文件
    reader.readAsDataURL( file );
};
