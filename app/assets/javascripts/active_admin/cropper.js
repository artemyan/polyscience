$(function() {
  $('#cropbox_scientist').Jcrop({
    onChange: article_update_crop,
    onSelect: article_update_crop,
    setSelect: [0, 0, 220, 220],
    aspectRatio: 220/220,
  boxWidth: 600
  });
});

function article_update_crop(coords) {
  $('#scientist_main').css({
    width: Math.round(220/coords.w * $('#cropbox_scientist').width()) + 'px',
    height: Math.round(220/coords.h * $('#cropbox_scientist').height()) + 'px',
    marginLeft: '-' + Math.round(220/coords.w * coords.x) + 'px',
    marginTop: '-' + Math.round(220/coords.h * coords.y) + 'px'
  });

  $("#scientist_crop_x").val(Math.round(coords.x));
  $("#scientist_crop_y").val(Math.round(coords.y));
  $("#scientist_crop_w").val(Math.round(coords.w));
  $("#scientist_crop_h").val(Math.round(coords.h));
};