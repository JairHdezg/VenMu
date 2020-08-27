const arrow = document.querySelector(".bi-chevron-up")
const homepage = document.querySelectorAll(".hide")
const closeModalBtn = document.getElementById("close-modal-btn");


const hidingHome = () =>{
    homepage.forEach ((element) => {
        element.classList = "d-none"
    })
}

arrow.addEventListener('click', hidingHome)



closeModalBtn.addEventListener('click',() =>{
    homepage.forEach ((element) => {
        element.classList = "row mt-5 mb-5"
    })
}) 
