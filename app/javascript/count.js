function count (){
  const articleText  = document.getElementById("posts_text");
  articleText.addEventListener("keyup", () => {
    const countVal = articleText.value.length;
    const charNum  = document.getElementById("count_chara");
    charNum.innerHTML = `${countVal}文字`;
  });
};
window.addEventListener('load', count);
