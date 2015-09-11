$(function(){
  // JSONファイル読み込み開始
  $.ajax({
    url:"records.json",
    cache:false,
    dataType:"json",
    success:function(json){
      var data=jsonRequest(json);
      initialize(data);
    }
  });
});

// JSONファイル読み込み完了
function jsonRequest(json){
  var data=[];
  if(json.Marker){
    var n=json.Marker.length;
    for(var i=0;i<n;i++){
      data.push(json.Marker[i]);
    }
  }
  return data;
}

// マップを生成して、複数のマーカーを追加
function initialize(data/*Array*/){
  var op={
    zoom:15,
    center:new google.maps.LatLng(35.507456,139.617585),
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("map_canvas"),op);

  var i=data.length;
  while(i-- >0){
    var dat=data[i];
    var obj={
      position:new google.maps.LatLng(dat.lat,dat.lng),
      map:map
    };
    var marker=new google.maps.Marker(obj);
  }
}