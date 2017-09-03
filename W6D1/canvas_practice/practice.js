document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('myCanvas');
  canvas.width = 500;
  canvas.height = 500;

  // rectangle
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(165,0,165)';
  ctx.fillRect(0,0,500,500);

  // circle
  ctx.beginPath();
  ctx.arc(250, 250, 100, 0, 2 * Math.PI, true);
  ctx.strokeStyle = 'pink';
  ctx.lineWidth = 2;
  ctx.stroke();

  ctx.fillStyle = 'rgb(100,0,200)';
  ctx.fill();

  // heart - Cubic curves example
  ctx.beginPath();
  ctx.strokeStyle = 'yellow';
  ctx.moveTo(75, 40);
  ctx.bezierCurveTo(75, 37, 70, 25, 50, 25);
  ctx.bezierCurveTo(20, 25, 20, 62.5, 20, 62.5);
  ctx.bezierCurveTo(20, 80, 40, 102, 75, 120);
  ctx.bezierCurveTo(110, 102, 130, 80, 130, 62.5);
  ctx.bezierCurveTo(130, 62.5, 130, 25, 100, 25);
  ctx.bezierCurveTo(85, 25, 75, 37, 75, 40);
  ctx.fillStyle = 'orange';
  ctx.fill();
});
