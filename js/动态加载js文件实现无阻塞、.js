function load_js(url,callback) {
    var script=document.createElement("script");
    if(script.readyState){
        script.onreadystatechange=function () {
            if(script.readyState=="load"||script.readyState=="complete"){
                script.onreadystatechange=null;
                callback();
            }else{
                script.onload=function () {
                    callback();
                }
            }
            script.src=url;
            document.getElementsByTagName("head").appendChild(script);
        }
    }


}
/*
* 实现加载多个脚本
* <script type="text/javascript" src="load_script.js"></script>
 <script type="text/javascript">
 load_script('file1.js', function() {
 load_script('file2.js', function() {
 load_script('file3.js', function() {
 //全部载入后的操作...
 } );
 } );
 } );
 </script>
* */
