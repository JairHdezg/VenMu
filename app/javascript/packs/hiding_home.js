const arrow = document.querySelector(".bi-chevron-up")
const homepage = document.querySelectorAll(".hide")
const closeModalBtn = document.getElementById("close-modal-btn");


const hidingHome = () =>{
    homepage.forEach ((element) => {
        element.classList = "d-none"
    })
}
if (arrow != undefined ) {
  arrow.addEventListener('click', hidingHome)
}

if (closeModalBtn != undefined ) {
  closeModalBtn.addEventListener('click',() =>{
      homešage.forEach ((element) => {
          element.classList = "row mt-5 mb-5"
      })
  })
}
