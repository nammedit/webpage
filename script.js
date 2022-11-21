

const setBg = () => {
  const randomColor = Math.floor(Math.random()*16777215).toString(16);
  document.body.backgroundColor = "#" + randomColor;
}

setBg();
document.body.backgroundColor = black;
